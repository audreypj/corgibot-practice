// Copyright (c) FIRST and other WPILib contributors.
// Open Source Software; you can modify and/or share it under the terms of
// the WPILib BSD license file in the root directory of this project.

package frc.robot.commands;

import edu.wpi.first.math.geometry.*;
import edu.wpi.first.math.trajectory.*;
import edu.wpi.first.math.util.Units;
import edu.wpi.first.wpilibj.Timer;
import edu.wpi.first.wpilibj2.command.CommandBase;
import edu.wpi.first.wpilibj.smartdashboard.SmartDashboard;
import java.util.List;

import frc.robot.MecanumDriveCTRE;

public class DriveTimed extends CommandBase {
  private final MecanumDriveCTRE mDrive;
  private final double mTimeS;
  private final double mSpeedY;
  private final double mSpeedX;
  private final double mSpeedRot;
  private final Timer mTimer = new Timer();

  /**
   * Creates a new DriveTimed.
   *
   * @param timeS The number of inches the robot will drive
   * @param speedY The speed at which the robot will drive in Y (front+/back-)
   * @param speedX The speed at which the robot will drive in X (left+/right-)
   * @param speedRot The speed at which the robot will rotate
   * @param drive The drive subsystem on which this command will run
   */
  public DriveTimed(
      double timeS,
      double speedY,
      double speedX,
      double speedRot,
      MecanumDriveCTRE drive) {
    mTimeS = timeS;
    mSpeedY = speedY;
    mSpeedX = speedX;
    mSpeedRot = speedRot;
    mDrive = drive;
  }

  @Override
  public void initialize() {
    //m_drive.resetEncoders();
    mDrive.stopMotor();
    mTimer.reset();
    mTimer.start();
  }

  @Override
  public void execute() {
    mDrive.driveCartesian(mSpeedY, mSpeedX, mSpeedRot);
  }

  @Override
  public void end(boolean interrupted) {
    mDrive.stopMotor();
  }

  @Override
  public boolean isFinished() {
    return mTimer.get() >= mTimeS;
  }
}