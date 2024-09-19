import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { EXERCISES } from '../utils/exercises.utils';

@Injectable()
export class ExercisesService {
  constructor(private prisma: PrismaService) {}

  async createBatch(): Promise<number> {
    const exercisesCount = await this.prisma.exercise.createMany({
      data: EXERCISES,
    });

    return exercisesCount.count;
  }

  async findAll() {
    const exercises = await this.prisma.exercise.findMany({
      take: 10,
    });
    return { status: 'success', data: exercises };
  }
}
