/*
  Warnings:

  - You are about to drop the `Exercice` table. If the table is not empty, all the data it contains will be lost.

*/
-- AlterTable
ALTER TABLE "Users" ADD COLUMN     "workoutId" VARCHAR(36);

-- DropTable
DROP TABLE "Exercice";

-- CreateTable
CREATE TABLE "Workouts" (
    "id" VARCHAR(36) NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Workouts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Exercices" (
    "id" VARCHAR(36) NOT NULL,
    "name" TEXT NOT NULL,
    "target" TEXT NOT NULL,
    "gifUrl" TEXT NOT NULL,
    "bodyPart" TEXT NOT NULL,
    "equipment" TEXT NOT NULL,
    "secondaryMuscles" TEXT[],
    "instructions" TEXT[],
    "workoutId" VARCHAR(36),

    CONSTRAINT "Exercices_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Users" ADD CONSTRAINT "Users_workoutId_fkey" FOREIGN KEY ("workoutId") REFERENCES "Workouts"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Exercices" ADD CONSTRAINT "Exercices_workoutId_fkey" FOREIGN KEY ("workoutId") REFERENCES "Workouts"("id") ON DELETE SET NULL ON UPDATE CASCADE;
