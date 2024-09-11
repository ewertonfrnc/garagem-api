import { Controller, Post } from '@nestjs/common';
import { ExercisesService } from './exercises.service';

@Controller('exercises')
export class ExercisesController {
  constructor(private readonly exercises: ExercisesService) {}

  @Post('batch')
  async createBatch() {
    const count = await this.exercises.createBatch();
    return {
      status: 'success',
      exercicesCount: count,
    };
  }
}
