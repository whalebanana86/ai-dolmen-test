CREATE TABLE public.notes (
    id serial NOT NULL,
    body text,
    CONSTRAINT notes_pkey PRIMARY KEY (id)
);
