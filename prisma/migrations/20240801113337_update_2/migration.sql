/*
  Warnings:

  - The values [PEENDING] on the enum `OrdersStatus` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "OrdersStatus_new" AS ENUM ('PENDING', 'DELIVERED', 'CANCELLED');
ALTER TABLE "Order" ALTER COLUMN "status" TYPE "OrdersStatus_new" USING ("status"::text::"OrdersStatus_new");
ALTER TYPE "OrdersStatus" RENAME TO "OrdersStatus_old";
ALTER TYPE "OrdersStatus_new" RENAME TO "OrdersStatus";
DROP TYPE "OrdersStatus_old";
COMMIT;
