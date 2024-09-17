/*
  Warnings:

  - You are about to drop the `WorkoutExercises` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "WorkoutExercises" DROP CONSTRAINT "WorkoutExercises_exerciseId_fkey";

-- DropForeignKey
ALTER TABLE "WorkoutExercises" DROP CONSTRAINT "WorkoutExercises_workoutId_fkey";

-- DropTable
DROP TABLE "WorkoutExercises";

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
