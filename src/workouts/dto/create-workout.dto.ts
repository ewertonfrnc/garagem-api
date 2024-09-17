import { IsNotEmpty, IsString } from 'class-validator';

export class CreateWorkoutDto {
  @IsNotEmpty()
  @IsString()
  name: string;

  @IsNotEmpty()
  @IsString()
  description: string;
}
