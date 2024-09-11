import { Body, Controller, HttpCode, HttpStatus, Post } from '@nestjs/common';
import { AuthService } from './auth.service';
import { RegisterDto } from './dto';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('signup')
  signUp(@Body() registerDTO: RegisterDto) {
    return this.authService.signUp(registerDTO);
  }

  @HttpCode(HttpStatus.OK)
  @Post('login')
  login() {}
}
