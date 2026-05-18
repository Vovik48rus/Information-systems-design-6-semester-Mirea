INSERT INTO "public"."Role" (id, name)
VALUES (1, 'Администратор'),
       (2, 'Модератор'),
       (3, 'Пользователь');

INSERT INTO "public"."User" (id, name, email, password_hash, role_id)
VALUES (1, 'Иван Иванов', 'ivan@example.com', 'hash1', 1),
       (2, 'Петр Петров', 'petr@example.com', 'hash2', 2),
       (3, 'Анна Сидорова', 'anna@example.com', 'hash3', 3);

INSERT INTO "public"."TypeChange" (id, name)
VALUES (1, 'Создание'),
       (2, 'Редактирование'),
       (3, 'Удаление');

INSERT INTO "public"."3D Model" (id, bucket_id, created_at, name)
VALUES (1, 100, '2025-01-10', 'Дом'),
       (2, 101, '2025-02-15', 'Машина'),
       (3, 102, '2025-03-20', 'Самолет');

INSERT INTO "public"."ModelMetadata" (id, model_id, description, author_id, created_at)
VALUES (1, 1, '3D модель жилого дома', 1, '2025-01-10'),
       (2, 2, '3D модель автомобиля', 2, '2025-02-15'),
       (3, 3, '3D модель самолета', 3, '2025-03-20');

INSERT INTO "public"."Permission" (id, can_read, can_write, can_delete, "3d_model_id", user_id)
VALUES (1, true, true, true, 1, 1),
       (2, true, true, false, 2, 2),
       (3, true, false, false, 3, 3),
       (4, true, false, false, 1, 2),
       (5, true, false, false, 2, 3);

INSERT INTO "public"."HistoryChange" (id, created_at, type_change_id, user_id, "3d_model_id")
VALUES (1, '2025-01-10', 1, 1, 1),
       (2, '2025-01-12', 2, 2, 1),
       (3, '2025-02-15', 1, 2, 2),
       (4, '2025-03-01', 2, 3, 2),
       (5, '2025-03-20', 1, 3, 3),
       (6, '2025-04-01', 3, 1, 3);
