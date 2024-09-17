import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateWorkoutDto } from './dto/create-workout.dto';
import { UpdateWorkoutDto } from './dto/update-workout.dto';

@Injectable()
export class WorkoutsService {
  constructor(private prisma: PrismaService) {}

  async create(createWorkoutDto: CreateWorkoutDto) {
    const workout = await this.prisma.workout.create({
      data: {
        name: createWorkoutDto.name,
        description: createWorkoutDto.description,
      },
    });

    return { status: 'success', data: { workout } };
  }

  async findAll() {
    const workouts = await this.prisma.workout.findMany();
    return { status: 'success', data: { workouts } };
  }

  findOne(id: number) {
    return `This action returns a #${id} workout`;
  }

  update(id: number, updateWorkoutDto: UpdateWorkoutDto) {
    return `This action updates a #${id} workout`;
  }

  remove(id: number) {
    return `This action removes a #${id} workout`;
  }
}
