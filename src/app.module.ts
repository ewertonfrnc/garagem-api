import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';

import { ExercisesModule } from './exercises/exercises.module';
import { PrismaModule } from './prisma/prisma.module';
import { AuthModule } from './auth/auth.module';
import { UsersModule } from './users/users.module';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    ExercisesModule,
    PrismaModule,
    AuthModule,
    UsersModule,
  ],
})
export class AppModule {}
