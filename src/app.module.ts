import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';

import { ExercisesModule } from './exercises/exercises.module';
import { PrismaModule } from './prisma/prisma.module';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    ExercisesModule,
    PrismaModule,
  ],
})
export class AppModule {}
