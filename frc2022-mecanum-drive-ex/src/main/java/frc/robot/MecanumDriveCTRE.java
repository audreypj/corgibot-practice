// Copyright (c) FIRST and other WPILib contributors.
// Open Source Software; you can modify and/or share it under the terms of
// the WPILib BSD license file in the root directory of this project.

package frc.robot;

import static java.util.Objects.requireNonNull;

import edu.wpi.first.hal.FRCNetComm.tInstances;
import edu.wpi.first.hal.FRCNetComm.tResourceType;
import edu.wpi.first.hal.HAL;
import edu.wpi.first.math.MathUtil;
import edu.wpi.first.util.sendable.Sendable;
import edu.wpi.first.util.sendable.SendableBuilder;
import edu.wpi.first.util.sendable.SendableRegistry;
import edu.wpi.first.wpilibj.drive.RobotDriveBase;
import edu.wpi.first.wpilibj.drive.Vector2d;

import com.ctre.phoenix.motorcontrol.ControlMode;
import com.ctre.phoenix.motorcontrol.IMotorController;

import frc.robot.commands.*;

/**
 * A derivative class of WPILib Mecanum drive for CAN Talon controllers.
 * 
 * A class for driving Mecanum drive platforms.
 *
 * <p>Mecanum drives are rectangular with one wheel on each corner. Each wheel has rollers toed in
 * 45 degrees toward the front or back. When looking at the wheels from the top, the roller axles
 * should form an X across the robot. Each drive() function provides different inverse kinematic
 * relations for a Mecanum drive robot.
 *
 * <p>Drive base diagram:
 *
 * <pre>
 * \\_______/
 * \\ |   | /
 *   |   |
 * /_|___|_\\
 * /       \\
 * </pre>
 *
 * <p>Each drive() function provides different inverse kinematic relations for a Mecanum drive
 * robot.
 *
 * <p>The positive Y axis points ahead, the positive X axis points right, and the positive Z axis
 * points down. Rotations follow the right-hand rule, so clockwise rotation around the Z axis is
 * positive.
 *
 * <p>Note: the axis conventions used in this class differ from DifferentialDrive. This may change
 * in a future year's WPILib release.
 *
 * <p>Inputs smaller then {@value edu.wpi.first.wpilibj.drive.RobotDriveBase#kDefaultDeadband} will
 * be set to 0, and larger values will be scaled so that the full range is still used. This deadband
 * value can be changed with {@link #setDeadband}.
 *
 * <p>RobotDrive porting guide: <br>
 * {@link #driveCartesian(double, double, double, double)} is equivalent to RobotDrive's
 * mecanumDrive_Cartesian(double, double, double, double) if a deadband of 0 is used, and the ySpeed
 * and gyroAngle values are inverted compared to RobotDrive (eg driveCartesian(xSpeed, -ySpeed,
 * zRotation, -gyroAngle). <br>
 * {@link #drivePolar(double, double, double)} is equivalent to RobotDrive's
 * mecanumDrive_Polar(double, double, double)} if a deadband of 0 is used.
 */
@SuppressWarnings("removal")
public class MecanumDriveCTRE extends RobotDriveBase implements Sendable, AutoCloseable {
  private static int instances;

  private final IMotorController m_frontLeftMotor;
  private final IMotorController m_rearLeftMotor;
  private final IMotorController m_frontRightMotor;
  private final IMotorController m_rearRightMotor;

  private double m_frontLeftCoeff = 1;
  private double m_rearLeftCoeff = 1;
  private double m_frontRightCoeff = 1;
  private double m_rearRightCoeff = 1;

  private ControlMode m_driveControlMode = ControlMode.PercentOutput;
  private double m_driveVelocityScale = 1;

  private boolean m_reported;

  /**
   * Wheel speeds for a mecanum drive.
   *
   * <p>Uses normalized voltage [-1.0..1.0].
   */
  @SuppressWarnings("MemberName")
  public static class WheelSpeeds {
    public double frontLeft;
    public double frontRight;
    public double rearLeft;
    public double rearRight;

    /** Constructs a WheelSpeeds with zeroes for all four speeds. */
    public WheelSpeeds() {}

    /**
     * Constructs a WheelSpeeds.
     *
     * @param frontLeft The front left speed [-1.0..1.0].
     * @param frontRight The front right speed [-1.0..1.0].
     * @param rearLeft The rear left speed [-1.0..1.0].
     * @param rearRight The rear right speed [-1.0..1.0].
     */
    public WheelSpeeds(double frontLeft, double frontRight, double rearLeft, double rearRight) {
      this.frontLeft = frontLeft;
      this.frontRight = frontRight;
      this.rearLeft = rearLeft;
      this.rearRight = rearRight;
    }
  }

  /**
   * Construct a MecanumDrive.
   *
   * <p>If a motor needs to be inverted, do so before passing it in.
   *
   * @param frontLeftMotor The motor on the front-left corner.
   * @param rearLeftMotor The motor on the rear-left corner.
   * @param frontRightMotor The motor on the front-right corner.
   * @param rearRightMotor The motor on the rear-right corner.
   */
  public MecanumDriveCTRE(
      IMotorController frontLeftMotor,
      IMotorController rearLeftMotor,
      IMotorController frontRightMotor,
      IMotorController rearRightMotor) {
    requireNonNull(frontLeftMotor, "Front-left motor cannot be null");
    requireNonNull(rearLeftMotor, "Rear-left motor cannot be null");
    requireNonNull(frontRightMotor, "Front-right motor cannot be null");
    requireNonNull(rearRightMotor, "Rear-right motor cannot be null");

    m_frontLeftMotor = frontLeftMotor;
    m_rearLeftMotor = rearLeftMotor;
    m_frontRightMotor = frontRightMotor;
    m_rearRightMotor = rearRightMotor;
    SendableRegistry.addChild(this, m_frontLeftMotor);
    SendableRegistry.addChild(this, m_rearLeftMotor);
    SendableRegistry.addChild(this, m_frontRightMotor);
    SendableRegistry.addChild(this, m_rearRightMotor);
    instances++;
    SendableRegistry.addLW(this, "MecanumDrive", instances);
  }

  /**
   * Set coefficient applied to percent output of each motor
   *
   * @param frontLeftCoeff The motor on the front-left corner.
   * @param rearLeftCoeff The motor on the rear-left corner.
   * @param frontRightCoeff The motor on the front-right corner.
   * @param rearRightCoeff The motor on the rear-right corner.
   */
  public void setMotorCoeff(
      double frontLeftCoeff,
      double rearLeftCoeff,
      double frontRightCoeff,
      double rearRightCoeff) {
    m_frontLeftCoeff = frontLeftCoeff;
    m_rearLeftCoeff = rearLeftCoeff;
    m_frontRightCoeff = frontRightCoeff;
    m_rearRightCoeff = rearRightCoeff;
  }

  /**
   * Set control mode and velocity scale to 1 by default
   * 
   * @param controlMode control mode to use setting talon output
   * @param velocityScale velocity for full scale in ticks/100ms
   */
  public void setControlMode(ControlMode controlMode) {
    m_driveControlMode = controlMode;
    m_driveVelocityScale = 1;
  }

  /**
   * Set control mode and velocity scale (opt)
   * 
   * @param controlMode control mode to use setting talon output
   * @param velocityScale velocity for full scale in ticks/100ms
   */
  public void setControlMode(ControlMode controlMode, double velocityScale) {
    m_driveControlMode = controlMode;
    m_driveVelocityScale = velocityScale;
  }

  @Override
  public void close() {
    SendableRegistry.remove(this);
  }

  /**
   * Drive method for Mecanum platform.
   *
   * <p>Angles are measured clockwise from the positive X axis. The robot's speed is independent
   * from its angle or rotation rate.
   *
   * @param ySpeed The robot's speed along the Y axis [-1.0..1.0]. Forward is positive.
   * @param xSpeed The robot's speed along the X axis [-1.0..1.0]. Right is positive.
   * @param zRotation The robot's rotation rate around the Z axis [-1.0..1.0]. Clockwise is
   *     positive.
   */
  @SuppressWarnings("ParameterName")
  public void driveCartesian(double ySpeed, double xSpeed, double zRotation) {
    driveCartesian(ySpeed, xSpeed, zRotation, 0.0);
  }

  /**
   * Drive method for Mecanum platform.
   *
   * <p>Angles are measured clockwise from the positive X axis. The robot's speed is independent
   * from its angle or rotation rate.
   *
   * @param ySpeed The robot's speed along the Y axis [-1.0..1.0]. Forward is positive.
   * @param xSpeed The robot's speed along the X axis [-1.0..1.0]. Right is positive.
   * @param zRotation The robot's rotation rate around the Z axis [-1.0..1.0]. Clockwise is
   *     positive.
   * @param gyroAngle The current angle reading from the gyro in degrees around the Z axis. Use this
   *     to implement field-oriented controls.
   */
  @SuppressWarnings("ParameterName")
  public void driveCartesian(double ySpeed, double xSpeed, double zRotation, double gyroAngle) {
    if (!m_reported) {
      HAL.report(
          tResourceType.kResourceType_RobotDrive, tInstances.kRobotDrive2_MecanumCartesian, 4);
      m_reported = true;
    }

    ySpeed = MathUtil.applyDeadband(ySpeed, m_deadband);
    xSpeed = MathUtil.applyDeadband(xSpeed, m_deadband);

    var speeds = driveCartesianIK(ySpeed, xSpeed, zRotation, gyroAngle);

    m_frontLeftMotor.set(m_driveControlMode, m_driveVelocityScale * speeds.frontLeft * m_maxOutput * m_frontLeftCoeff);
    m_frontRightMotor.set(m_driveControlMode, m_driveVelocityScale * speeds.frontRight * m_maxOutput * m_frontRightCoeff);
    m_rearLeftMotor.set(m_driveControlMode, m_driveVelocityScale * speeds.rearLeft * m_maxOutput * m_rearLeftCoeff);
    m_rearRightMotor.set(m_driveControlMode, m_driveVelocityScale * speeds.rearRight * m_maxOutput * m_rearRightCoeff);

    feed();
  }

  /**
   * Drive method for Mecanum platform.
   *
   * <p>Angles are measured counter-clockwise from straight ahead. The speed at which the robot
   * drives (translation) is independent from its angle or rotation rate.
   *
   * @param magnitude The robot's speed at a given angle [-1.0..1.0]. Forward is positive.
   * @param angle The angle around the Z axis at which the robot drives in degrees [-180..180].
   * @param zRotation The robot's rotation rate around the Z axis [-1.0..1.0]. Clockwise is
   *     positive.
   */
  @SuppressWarnings("ParameterName")
  public void drivePolar(double magnitude, double angle, double zRotation) {
    if (!m_reported) {
      HAL.report(tResourceType.kResourceType_RobotDrive, tInstances.kRobotDrive2_MecanumPolar, 4);
      m_reported = true;
    }

    driveCartesian(
        magnitude * Math.cos(angle * (Math.PI / 180.0)),
        magnitude * Math.sin(angle * (Math.PI / 180.0)),
        zRotation,
        0.0);
  }

  /**
   * Cartesian inverse kinematics for Mecanum platform.
   *
   * <p>Angles are measured clockwise from the positive X axis. The robot's speed is independent
   * from its angle or rotation rate.
   *
   * @param ySpeed The robot's speed along the Y axis [-1.0..1.0]. Forward is positive.
   * @param xSpeed The robot's speed along the X axis [-1.0..1.0]. Right is positive.
   * @param zRotation The robot's rotation rate around the Z axis [-1.0..1.0]. Clockwise is
   *     positive.
   * @return Wheel speeds [-1.0..1.0].
   */
  @SuppressWarnings("ParameterName")
  public static WheelSpeeds driveCartesianIK(double ySpeed, double xSpeed, double zRotation) {
    return driveCartesianIK(ySpeed, xSpeed, zRotation, 0.0);
  }

  /**
   * Cartesian inverse kinematics for Mecanum platform.
   *
   * <p>Angles are measured clockwise from the positive X axis. The robot's speed is independent
   * from its angle or rotation rate.
   *
   * @param ySpeed The robot's speed along the Y axis [-1.0..1.0]. Forward is positive.
   * @param xSpeed The robot's speed along the X axis [-1.0..1.0]. Right is positive.
   * @param zRotation The robot's rotation rate around the Z axis [-1.0..1.0]. Clockwise is
   *     positive.
   * @param gyroAngle The current angle reading from the gyro in degrees around the Z axis. Use this
   *     to implement field-oriented controls.
   * @return Wheel speeds [-1.0..1.0].
   */
  @SuppressWarnings("ParameterName")
  public static WheelSpeeds driveCartesianIK(
      double ySpeed, double xSpeed, double zRotation, double gyroAngle) {
    ySpeed = MathUtil.clamp(ySpeed, -1.0, 1.0);
    xSpeed = MathUtil.clamp(xSpeed, -1.0, 1.0);

    // Compensate for gyro angle.
    Vector2d input = new Vector2d(ySpeed, xSpeed);
    input.rotate(-gyroAngle);

    double[] wheelSpeeds = new double[4];
    wheelSpeeds[MotorType.kFrontLeft.value] = input.x + input.y + zRotation;
    wheelSpeeds[MotorType.kFrontRight.value] = input.x - input.y - zRotation;
    wheelSpeeds[MotorType.kRearLeft.value] = input.x - input.y + zRotation;
    wheelSpeeds[MotorType.kRearRight.value] = input.x + input.y - zRotation;

    normalize(wheelSpeeds);

    return new WheelSpeeds(
        wheelSpeeds[MotorType.kFrontLeft.value],
        wheelSpeeds[MotorType.kFrontRight.value],
        wheelSpeeds[MotorType.kRearLeft.value],
        wheelSpeeds[MotorType.kRearRight.value]);
  }

  @Override
  public void stopMotor() {
    m_frontLeftMotor.set(ControlMode.PercentOutput, 0);
    m_frontRightMotor.set(ControlMode.PercentOutput, 0);
    m_rearLeftMotor.set(ControlMode.PercentOutput, 0);
    m_rearRightMotor.set(ControlMode.PercentOutput, 0);
    feed();
  }

  @Override
  public String getDescription() {
    return "MecanumDrive";
  }

  @Override
  public void initSendable(SendableBuilder builder) {
  //   builder.setSmartDashboardType("MecanumDrive");
  //   builder.setActuator(true);
  //   builder.setSafeState(this::stopMotor);
  //   builder.addDoubleProperty(
  //       "Front Left Motor Speed", m_frontLeftMotor::get, m_frontLeftMotor::set);
  //   builder.addDoubleProperty(
  //       "Front Right Motor Speed",
  //       () -> m_frontRightMotor.get(),
  //       value -> m_frontRightMotor.set(value));
  //   builder.addDoubleProperty("Rear Left Motor Speed", m_rearLeftMotor::get, m_rearLeftMotor::set);
  //   builder.addDoubleProperty(
  //       "Rear Right Motor Speed",
  //       () -> m_rearRightMotor.get(),
  //       value -> m_rearRightMotor.set(value));
  }
}
