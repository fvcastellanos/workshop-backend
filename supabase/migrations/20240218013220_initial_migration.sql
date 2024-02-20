create table
  public.car_brand (
    id uuid not null default gen_random_uuid (),
    name text not null,
    description text null,
    active boolean not null default true,
    tenant text not null,
    created timestamp with time zone not null default (now() at time zone 'utc'::text),
    updated timestamp with time zone null,
    constraint car_brand_pkey primary key (id)
  ) tablespace pg_default;

create index if not exists car_brand_active_idx on public.car_brand using btree (active) tablespace pg_default;

create table
  public.tenant (
    id uuid not null default gen_random_uuid (),
    name text not null,
    description text null,
    active boolean not null default true,
    constraint tenant_pkey primary key (id),
    constraint tenant_name_key unique (name)
  ) tablespace pg_default;

  create table
  public.user_tenant (
    id uuid not null default gen_random_uuid (),
    tenant text not null,
    user_id text not null,
    created timestamp with time zone not null default (now() at time zone 'utc'::text),
    constraint user_tenant_pkey primary key (id)
  ) tablespace pg_default;

create unique index uq_user_tenant_tenant_user_id on public.user_tenant using btree (tenant, user_id) tablespace pg_default;

