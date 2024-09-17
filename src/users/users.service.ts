import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class UsersService {
  constructor(private prisma: PrismaService) {}

  async getUsers() {
    // const users = await this.prisma.user.findMany();

    return {
      status: 'success',
      // data: { users },
    };
  }
}
