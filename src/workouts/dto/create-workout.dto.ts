import { IsNotEmpty, IsString, IsArray } from 'class-validator';

export class CreateWorkoutDto {
  @IsNotEmpty()
  @IsString()
  name: string;

  @IsNotEmpty()
  @IsString()
  description: string;
}

export class WorkoutExercisesDto {
  @IsArray()
  exercises: string[];
}
