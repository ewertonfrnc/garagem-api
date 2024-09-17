/*
  Warnings:

  - You are about to drop the `Exercices` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `description` to the `Workouts` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Workouts" ADD COLUMN     "description" TEXT NOT NULL;

-- DropTable
DROP TABLE "Exercices";

-- CreateTable
CREATE TABLE "Exercises" (
    "id" VARCHAR(36) NOT NULL,
    "name" TEXT NOT NULL,
    "target" TEXT NOT NULL,
    "gifUrl" TEXT NOT NULL,
    "bodyPart" TEXT NOT NULL,
    "equipment" TEXT NOT NULL,
    "secondaryMuscles" TEXT[],
    "instructions" TEXT[],

    CONSTRAINT "Exercises_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ExerciseToWorkout" (
    "A" VARCHAR(36) NOT NULL,
    "B" VARCHAR(36) NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ExerciseToWorkout_AB_unique" ON "_ExerciseToWorkout"("A", "B");

-- CreateIndex
CREATE INDEX "_ExerciseToWorkout_B_index" ON "_ExerciseToWorkout"("B");

-- AddForeignKey
ALTER TABLE "_ExerciseToWorkout" ADD CONSTRAINT "_ExerciseToWorkout_A_fkey" FOREIGN KEY ("A") REFERENCES "Exercises"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ExerciseToWorkout" ADD CONSTRAINT "_ExerciseToWorkout_B_fkey" FOREIGN KEY ("B") REFERENCES "Workouts"("id") ON DELETE CASCADE ON UPDATE CASCADE;
