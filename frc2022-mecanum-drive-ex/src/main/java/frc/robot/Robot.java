// Copyright (c) FIRST and other WPILib contributors.
// Open Source Software; you can modify and/or share it under the terms of
// the WPILib BSD license file in the root directory of this project.

package frc.robot;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import edu.wpi.first.wpilibj.Joystick;
import edu.wpi.first.wpilibj.TimedRobot;
import edu.wpi.first.wpilibj.motorcontrol.Talon;
import edu.wpi.first.wpilibj.smartdashboard.*;
import edu.wpi.first.wpilibj2.command.Command;
import edu.wpi.first.wpilibj2.command.CommandScheduler;

import com.ctre.phoenix.motorcontrol.can.TalonSRX;
import com.ctre.phoenix.motorcontrol.can.TalonSRXConfiguration;
import com.ctre.phoenix.motorcontrol.ControlMode;
import com.ctre.phoenix.motorcontrol.Faults;
import com.ctre.phoenix.motorcontrol.LimitSwitchSource;
import com.ctre.phoenix.motorcontrol.NeutralMode;
import com.ctre.phoenix.motorcontrol.FeedbackDevice;

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
  private TalonSRX mFrontLeftTalon;
  private TalonSRX mRearLeftTalon;
  private TalonSRX mFrontRightTalon;
  private TalonSRX mRearRightTalon;

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
    mFrontLeftTalon = new TalonSRX(kFrontLeftId);
    mRearLeftTalon = new TalonSRX(kRearLeftId);
    mFrontRightTalon = new TalonSRX(kFrontRightId);
    mRearRightTalon = new TalonSRX(kRearRightId);
    List<TalonSRX> mDriveTalons = new ArrayList<>(Arrays.asList(
      mFrontLeftTalon, 
      mRearLeftTalon, 
      mFrontRightTalon, 
      mRearRightTalon
    ));
    // default motor settings
    mDriveTalonSRXConfigAll = new TalonSRXConfiguration();
    mDriveTalonSRXConfigAll.forwardLimitSwitchSource = LimitSwitchSource.Deactivated;
    mDriveTalonSRXConfigAll.reverseLimitSwitchSource = LimitSwitchSource.Deactivated;
    //mDriveTalons.stream().map(t -> t.configAllSettings(mDriveTalonSRXConfigAll));
    //if we don't care about error codes here we can do this too: 
    mDriveTalons.forEach(talon -> talon.configAllSettings(mDriveTalonSRXConfigAll));
    // invert the right side motors
    mFrontRightTalon.setInverted(true);
    mRearRightTalon.setInverted(true);
    // coast the drive motors - not part of configAllSettings
    mDriveTalons.forEach(talon -> talon.setNeutralMode(NeutralMode.Coast));
    // configure velocity control
    mDriveTalons.forEach(
      talon -> talon.configSelectedFeedbackSensor(FeedbackDevice.CTRE_MagEncoder_Relative, 0, 0)
    );
    mDriveTalons.forEach(talon -> talon.config_kF(0, 3.83625));
    mDriveTalons.forEach(talon -> talon.config_kP(0, 2.1));
    mDriveTalons.forEach(talon -> talon.config_kI(0, 0.002));

    mRobotDrive = new MecanumDriveCTRE(mFrontLeftTalon, mRearLeftTalon, mFrontRightTalon, mRearRightTalon);
    // adjust for 117rpm in front and 312rpm in back
    mRobotDrive.setMotorCoeff(1, 0.375, 1, 0.375);
    // enable velocity control - max scale in ticks/100ms
    mRobotDrive.setControlMode(ControlMode.Velocity, 260);

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
    mFrontLeftTalon.getFaults(frontLeftFaults);
    mFrontRightTalon.getFaults(frontRightFaults);
    mRearLeftTalon.getFaults(rearLeftFaults);
    mRearRightTalon.getFaults(rearRightFaults);
    SmartDashboard.putString("frontLeft.faults", frontLeftFaults.toString());
    SmartDashboard.putString("frontRight.faults", frontRightFaults.toString());
    SmartDashboard.putString("rearLeft.faults", rearLeftFaults.toString());
    SmartDashboard.putString("rearRight.faults", rearRightFaults.toString());
    SmartDashboard.putNumber("frontLeft.encoder", mFrontLeftTalon.getSensorCollection().getQuadraturePosition());
    SmartDashboard.putNumber("frontRight.encoder", mFrontRightTalon.getSensorCollection().getQuadraturePosition());
    SmartDashboard.putNumber("rearLeft.encoder", mRearLeftTalon.getSensorCollection().getQuadraturePosition());
    SmartDashboard.putNumber("rearRight.encoder", mRearRightTalon.getSensorCollection().getQuadraturePosition());
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
      -mJoystickA.getRawAxis(kJoystickALeftY),
      mJoystickA.getRawAxis(kJoystickALeftX),
      mJoystickA.getRawAxis(kJoystickARightX),
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
