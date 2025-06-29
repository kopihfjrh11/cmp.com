-- Создание таблицы avatars для хранения аватаров пользователей
create table if not exists avatars (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references users(id) on delete cascade,
  url text not null,
  uploaded_at timestamp with time zone default now(),
  is_active boolean default true
);

-- Индекс для быстрого поиска активного аватара пользователя
create index if not exists idx_avatars_user_active on avatars(user_id, is_active);

-- При добавлении нового аватара старые можно делать неактивными через update avatars set is_active=false where user_id=...;
