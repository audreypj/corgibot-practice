// Copyright (c) FIRST and other WPILib contributors.
// Open Source Software; you can modify and/or share it under the terms of
// the WPILib BSD license file in the root directory of this project.

package frc.robot;

import edu.wpi.first.wpilibj.Joystick;
import edu.wpi.first.wpilibj.TimedRobot;
import edu.wpi.first.wpilibj.smartdashboard.SmartDashboard;

import com.ctre.phoenix.motorcontrol.can.TalonSRX;
import com.ctre.phoenix.motorcontrol.Faults;

import frc.robot.MecanumDriveCTRE;

/** This is a demo program showing how to use Mecanum control with the MecanumDrive class. */
public class Robot extends TimedRobot {
  /* RIO is in the front left of bot */
  private static final int kFrontLeftId = 0x03;
  private static final int kRearLeftId = 0x06;
  private static final int kFrontRightId = 0x01;
  private static final int kRearRightId = 0x07;

  private static final int kJoystickAChannel = 0;
  private static final int kJoystickALeftX = 0;
  private static final int kJoystickALeftY = 1;
  private static final int kJoystickARightX = 4;
  private static final int kJoystickARightY = 5;

  private TalonSRX frontLeft;
  private TalonSRX rearLeft;
  private TalonSRX frontRight;
  private TalonSRX rearRight;

  private MecanumDriveCTRE m_robotDrive;
  private Joystick m_joystickA;

  @Override
  public void robotInit() {
    frontLeft = new TalonSRX(kFrontLeftId);
    rearLeft = new TalonSRX(kRearLeftId);
    frontRight = new TalonSRX(kFrontRightId);
    rearRight = new TalonSRX(kRearRightId);

    // Invert the right side motors.
    // You may need to change or remove this to match your robot.
    frontRight.setInverted(true);
    rearRight.setInverted(true);

    m_robotDrive = new MecanumDriveCTRE(frontLeft, rearLeft, frontRight, rearRight);
    // adjust for 117rpm in front and 312rpm in back
    m_robotDrive.setMotorCoeff(1, 0.375, 1, 0.375);

    m_joystickA = new Joystick(kJoystickAChannel);
  }

  public void doSmartDashboardTelemetry() {    
    // SmartDashboard.putNumber("m_stick.x", m_stick.getX());
    // SmartDashboard.putNumber("m_stick.y", m_stick.getY());
    Faults frontLeftFaults = new Faults();
    Faults frontRightFaults = new Faults();
    Faults rearLeftFaults = new Faults();
    Faults rearRightFaults = new Faults();
    frontLeft.getFaults(frontLeftFaults);
    frontRight.getFaults(frontRightFaults);
    rearLeft.getFaults(rearLeftFaults);
    rearRight.getFaults(rearRightFaults);
    SmartDashboard.putString("frontLeft.faults", frontLeftFaults.toString());
    SmartDashboard.putString("frontRight.faults", frontRightFaults.toString());
    SmartDashboard.putString("rearLeft.faults", rearLeftFaults.toString());
    SmartDashboard.putString("rearRight.faults", rearRightFaults.toString());
    SmartDashboard.putNumber("frontLeft.encoder", frontLeft.getSensorCollection().getQuadraturePosition());
    SmartDashboard.putNumber("frontRight.encoder", frontRight.getSensorCollection().getQuadraturePosition());
    SmartDashboard.putNumber("rearLeft.encoder", rearLeft.getSensorCollection().getQuadraturePosition());
    SmartDashboard.putNumber("rearRight.encoder", rearRight.getSensorCollection().getQuadraturePosition());
  }

  @Override
  public void robotPeriodic() {
    doSmartDashboardTelemetry();
  }

  @Override
  public void teleopPeriodic() {
    // Use the joystick X axis for lateral movement, Y axis for forward
    // movement, and Z axis for rotation.
    m_robotDrive.driveCartesian(
      -m_joystickA.getRawAxis(kJoystickARightY),
      m_joystickA.getRawAxis(kJoystickARightX),
      m_joystickA.getRawAxis(kJoystickALeftX),
      0.0);
  }

  //public Command getAutonomousCommand() {
  //}

  @Override
  public void autonomousInit() {
    // frontLeft.set(TalonSRXControlMode.PercentOutput, 1.0);
    // frontRight.set(TalonSRXControlMode.PercentOutput, 1.0);
    // rearLeft.set(TalonSRXControlMode.PercentOutput, 0.375);
    // rearRight.set(TalonSRXControlMode.PercentOutput, 0.375);
  }

  @Override
  public void autonomousPeriodic() {
    m_robotDrive.driveCartesian(1.0, 0.0, 0.0, 0.0);
  }
}
