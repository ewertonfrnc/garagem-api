import { ConfigService } from '@nestjs/config';
import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';

import { PrismaService } from '../prisma/prisma.service';
import { RegisterDto } from './dto';
import * as bcrypt from 'bcrypt';
import { config } from 'rxjs';

@Injectable()
export class AuthService {
  constructor(
    private config: ConfigService,
    private prisma: PrismaService,
    private jwt: JwtService,
  ) {}

  signToken(userId: string) {
    return this.jwt.sign(
      { id: userId },
      {
        secret: this.config.get('JWT_SECRET'),
        expiresIn: this.config.get('JWT_EXPIRES_IN'),
      },
    );
  }

  async signUp(registerDTO: RegisterDto) {
    const hash = await bcrypt.hash(registerDTO.password, 14);

    const user = await this.prisma.user.create({
      data: {
        name: registerDTO.name,
        email: registerDTO.email,
        password: hash,
      },
    });

    const token = this.signToken(user.id);

    delete user.password;
    return { status: 'success', token, data: { user } };
  }

  async login() {}
}
