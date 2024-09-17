/*
  Warnings:

  - You are about to drop the column `workoutId` on the `Exercices` table. All the data in the column will be lost.
  - You are about to drop the `Users` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[name]` on the table `Workouts` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Exercices" DROP CONSTRAINT "Exercices_workoutId_fkey";

-- DropForeignKey
ALTER TABLE "Users" DROP CONSTRAINT "Users_workoutId_fkey";

-- AlterTable
ALTER TABLE "Exercices" DROP COLUMN "workoutId";

-- DropTable
DROP TABLE "Users";

-- CreateIndex
CREATE UNIQUE INDEX "Workouts_name_key" ON "Workouts"("name");
