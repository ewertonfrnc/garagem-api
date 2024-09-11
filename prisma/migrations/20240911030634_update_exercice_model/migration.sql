/*
  Warnings:

  - Added the required column `bodyPart` to the `Exercice` table without a default value. This is not possible if the table is not empty.
  - Added the required column `equipment` to the `Exercice` table without a default value. This is not possible if the table is not empty.
  - Added the required column `gifUrl` to the `Exercice` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Exercice` table without a default value. This is not possible if the table is not empty.
  - Added the required column `target` to the `Exercice` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Exercice" ADD COLUMN     "bodyPart" TEXT NOT NULL,
ADD COLUMN     "equipment" TEXT NOT NULL,
ADD COLUMN     "gifUrl" TEXT NOT NULL,
ADD COLUMN     "instructions" TEXT[],
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "secondaryMuscles" TEXT[],
ADD COLUMN     "target" TEXT NOT NULL;
