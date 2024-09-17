/*
  Warnings:

  - You are about to drop the `_ExerciseToWorkout` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_ExerciseToWorkout" DROP CONSTRAINT "_ExerciseToWorkout_A_fkey";

-- DropForeignKey
ALTER TABLE "_ExerciseToWorkout" DROP CONSTRAINT "_ExerciseToWorkout_B_fkey";

-- DropTable
DROP TABLE "_ExerciseToWorkout";

-- CreateTable
CREATE TABLE "WorkoutExercises" (
    "workoutId" TEXT NOT NULL,
    "exerciseId" TEXT NOT NULL,

    CONSTRAINT "WorkoutExercises_pkey" PRIMARY KEY ("workoutId","exerciseId")
);

-- AddForeignKey
ALTER TABLE "WorkoutExercises" ADD CONSTRAINT "WorkoutExercises_workoutId_fkey" FOREIGN KEY ("workoutId") REFERENCES "Workouts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorkoutExercises" ADD CONSTRAINT "WorkoutExercises_exerciseId_fkey" FOREIGN KEY ("exerciseId") REFERENCES "Exercises"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
