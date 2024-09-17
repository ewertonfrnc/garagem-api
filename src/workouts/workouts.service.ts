import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import {
  CreateWorkoutDto,
  WorkoutExercisesDto,
} from './dto/create-workout.dto';
import { UpdateWorkoutDto } from './dto/update-workout.dto';

@Injectable()
export class WorkoutsService {
  constructor(private prisma: PrismaService) {}

  async create(createWorkoutDto: CreateWorkoutDto) {
    try {
      const workout = await this.prisma.workout.create({
        data: {
          name: createWorkoutDto.name,
          description: createWorkoutDto.description,
        },
        include: { exercises: true },
      });

      return { status: 'success', data: { workout } };
    } catch (e) {
      return { status: 'error', error: e };
    }
  }

  async findAll() {
    const workouts = await this.prisma.workout.findMany({
      include: { exercises: true },
    });

    return { status: 'success', data: { workouts } };
  }

  findOne(id: number) {
    return `This action returns a #${id} workout`;
  }

  async update(id: string, updateWorkoutDto: UpdateWorkoutDto) {
    try {
      const updatedWorkout = await this.prisma.workout.update({
        where: { id },
        data: {
          name: updateWorkoutDto.name,
          description: updateWorkoutDto.description,
        },
        include: { exercises: true },
      });

      return { status: 'success', data: { updatedWorkout } };
    } catch (error) {
      return { status: 'fail', message: error };
    }
  }

  remove(id: number) {
    return `This action removes a #${id} workout`;
  }

  async createWorkoutExercises(
    id: string,
    workoutExercisesDto: WorkoutExercisesDto,
  ) {
    try {
      const updateWorkout = await this.prisma.workout.update({
        where: { id },
        data: {
          exercises: {
            connect: workoutExercisesDto.exercises.map((exerciseId) => ({
              id: exerciseId,
            })),
          },
        },
        include: { exercises: true },
      });

      return { status: 'success', data: { workout: updateWorkout } };
    } catch (error) {
      return { status: 'fail', message: error };
    }
  }
}
