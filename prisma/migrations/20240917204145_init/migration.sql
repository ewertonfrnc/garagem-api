-- CreateTable
CREATE TABLE "Workouts" (
    "id" VARCHAR(36) NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "Workouts_pkey" PRIMARY KEY ("id")
);

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
    "workoutId" VARCHAR(36),

    CONSTRAINT "Exercises_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Workouts_name_key" ON "Workouts"("name");

-- AddForeignKey
ALTER TABLE "Exercises" ADD CONSTRAINT "Exercises_workoutId_fkey" FOREIGN KEY ("workoutId") REFERENCES "Workouts"("id") ON DELETE SET NULL ON UPDATE CASCADE;
