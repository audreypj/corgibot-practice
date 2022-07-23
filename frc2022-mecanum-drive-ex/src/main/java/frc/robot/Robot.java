// Copyright (c) FIRST and other WPILib contributors.
// Open Source Software; you can modify and/or share it under the terms of
// the WPILib BSD license file in the root directory of this project.

package frc.robot;

import edu.wpi.first.wpilibj.Joystick;
import edu.wpi.first.wpilibj.TimedRobot;
import edu.wpi.first.wpilibj.motorcontrol.Talon;
import edu.wpi.first.wpilibj.smartdashboard.*;
import edu.wpi.first.wpilibj2.command.Command;
import edu.wpi.first.wpilibj2.command.CommandScheduler;

import com.ctre.phoenix.motorcontrol.can.TalonSRX;
import com.ctre.phoenix.motorcontrol.can.TalonSRXConfiguration;
import com.ctre.phoenix.motorcontrol.Faults;

import frc.robot.MecanumDriveCTRE;
import frc.robot.commands.*;

/** This is a demo program showing how to use Mecanum control with the MecanumDrive class. */
public class Robot extends TimedRobot {
  /* CAN IDs; RIO is in the front left of bot */
  private static final int kFrontLeftId = 0x03;
  private static final int kRearLeftId = 0x06;
  private static final int kFrontRightId = 0x01;
  private static final int kRearRightId = 0x07;
  /* Joystick Channels */
  private static final int kJoystickAChannel = 0;
  private static final int kJoystickALeftX = 0;
  private static final int kJoystickALeftY = 1;
  private static final int kJoystickARightX = 4;
  private static final int kJoystickARightY = 5;
  /* Robot Hardware */
  private TalonSRX mFrontLeft;
  private TalonSRX mRearLeft;
  private TalonSRX mFrontRight;
  private TalonSRX mRearRight;
  private MecanumDriveCTRE mRobotDrive;
  private Joystick mJoystickA;
  private TalonSRXConfiguration mDriveTalonSRXConfigAll;
  /* Robot Commands */
  private final DriveTimed mSimpleAuto = new DriveTimed(3, 1, 0, 0, mRobotDrive);
  private final DriveTimed mAnotherAuto = new DriveTimed(10, 1, 0, 0, mRobotDrive);
  SendableChooser<DriveTimed> m_chooser = new SendableChooser<>();
  private DriveTimed m_auto_command;

  @Override
  public void robotInit() {
    mFrontLeft = new TalonSRX(kFrontLeftId);
    mRearLeft = new TalonSRX(kRearLeftId);
    mFrontRight = new TalonSRX(kFrontRightId);
    mRearRight = new TalonSRX(kRearRightId);
    // default motor settings
    mFrontLeft.configAllSettings(mDriveTalonSRXConfigAll);
    // invert the right side motors
    mFrontRight.setInverted(true);
    mRearRight.setInverted(true);

    mRobotDrive = new MecanumDriveCTRE(mFrontLeft, mRearLeft, mFrontRight, mRearRight);
    // adjust for 117rpm in front and 312rpm in back
    mRobotDrive.setMotorCoeff(1, 0.375, 1, 0.375);

    mJoystickA = new Joystick(kJoystickAChannel);

    // auto selections
    m_chooser.setDefaultOption("Simple Auto", mSimpleAuto);
    m_chooser.addOption("Another Auto", mAnotherAuto);
  }

  public void doSmartDashboardTelemetry() {    
    // SmartDashboard.putNumber("m_stick.x", m_stick.getX());
    // SmartDashboard.putNumber("m_stick.y", m_stick.getY());
    Faults frontLeftFaults = new Faults();
    Faults frontRightFaults = new Faults();
    Faults rearLeftFaults = new Faults();
    Faults rearRightFaults = new Faults();
    mFrontLeft.getFaults(frontLeftFaults);
    mFrontRight.getFaults(frontRightFaults);
    mRearLeft.getFaults(rearLeftFaults);
    mRearRight.getFaults(rearRightFaults);
    SmartDashboard.putString("frontLeft.faults", frontLeftFaults.toString());
    SmartDashboard.putString("frontRight.faults", frontRightFaults.toString());
    SmartDashboard.putString("rearLeft.faults", rearLeftFaults.toString());
    SmartDashboard.putString("rearRight.faults", rearRightFaults.toString());
    SmartDashboard.putNumber("frontLeft.encoder", mFrontLeft.getSensorCollection().getQuadraturePosition());
    SmartDashboard.putNumber("frontRight.encoder", mFrontRight.getSensorCollection().getQuadraturePosition());
    SmartDashboard.putNumber("rearLeft.encoder", mRearLeft.getSensorCollection().getQuadraturePosition());
    SmartDashboard.putNumber("rearRight.encoder", mRearRight.getSensorCollection().getQuadraturePosition());
  }

  @Override
  public void robotPeriodic() {
    // Runs the Scheduler.  This is responsible for polling buttons, adding newly-scheduled
    // commands, running already-scheduled commands, removing finished or interrupted commands,
    // and running subsystem periodic() methods.  This must be called from the robot's periodic
    // block in order for anything in the Command-based framework to work.
    CommandScheduler.getInstance().run();
    // always report telemetry
    doSmartDashboardTelemetry();
  }

  @Override
  public void teleopInit() {}

  @Override
  public void teleopPeriodic() {
    // Use the joystick X axis for lateral movement, Y axis for forward
    // movement, and Z axis for rotation.
    mRobotDrive.driveCartesian(
      -mJoystickA.getRawAxis(kJoystickARightY),
      mJoystickA.getRawAxis(kJoystickARightX),
      mJoystickA.getRawAxis(kJoystickALeftX),
      0.0);
  }

  //public Command getAutonomousCommand() {
  //}

  @Override
  public void autonomousInit() {
    m_auto_command = m_chooser.getSelected();
    // schedule the autonomous command
    if (m_auto_command != null) {
      m_auto_command.schedule();
    }
  }

  @Override
  public void autonomousPeriodic() {}
}
