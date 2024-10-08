PGDMP                         |           world    15.4    15.4 %    %           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            &           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            '           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            (           1262    16398    world    DATABASE     y   CREATE DATABASE world WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Israel.1252';
    DROP DATABASE world;
                postgres    false            �            1259    16400    capitals    TABLE     �   CREATE TABLE public.capitals (
    id integer NOT NULL,
    country character varying(45),
    capital character varying(45)
);
    DROP TABLE public.capitals;
       public         heap    postgres    false            �            1259    16399    capitals_id_seq    SEQUENCE     �   CREATE SEQUENCE public.capitals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.capitals_id_seq;
       public          postgres    false    215            )           0    0    capitals_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.capitals_id_seq OWNED BY public.capitals.id;
          public          postgres    false    214            �            1259    16432 	   countries    TABLE     �   CREATE TABLE public.countries (
    id integer NOT NULL,
    country_code character varying(2),
    country_name character varying(100)
);
    DROP TABLE public.countries;
       public         heap    postgres    false            �            1259    16431    countries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.countries_id_seq;
       public          postgres    false    221            *           0    0    countries_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;
          public          postgres    false    220            �            1259    16407    flags    TABLE     f   CREATE TABLE public.flags (
    id integer NOT NULL,
    name character varying(45),
    flag text
);
    DROP TABLE public.flags;
       public         heap    postgres    false            �            1259    16406    flags_id_seq    SEQUENCE     �   CREATE SEQUENCE public.flags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.flags_id_seq;
       public          postgres    false    217            +           0    0    flags_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.flags_id_seq OWNED BY public.flags.id;
          public          postgres    false    216            �            1259    16495    tracker_members    TABLE     q   CREATE TABLE public.tracker_members (
    id integer NOT NULL,
    name text,
    color character varying(20)
);
 #   DROP TABLE public.tracker_members;
       public         heap    postgres    false            �            1259    16494    tracker_members_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tracker_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.tracker_members_id_seq;
       public          postgres    false    223            ,           0    0    tracker_members_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tracker_members_id_seq OWNED BY public.tracker_members.id;
          public          postgres    false    222            �            1259    16537    visited_countries    TABLE     �   CREATE TABLE public.visited_countries (
    id integer NOT NULL,
    member_id integer,
    country_code character varying(2)
);
 %   DROP TABLE public.visited_countries;
       public         heap    postgres    false            �            1259    16536    visited_countries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.visited_countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.visited_countries_id_seq;
       public          postgres    false    225            -           0    0    visited_countries_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.visited_countries_id_seq OWNED BY public.visited_countries.id;
          public          postgres    false    224            �            1259    16416 
   world_food    TABLE     �   CREATE TABLE public.world_food (
    id integer NOT NULL,
    country character varying(45),
    rice_production real,
    wheat_production real
);
    DROP TABLE public.world_food;
       public         heap    postgres    false            �            1259    16415    world_food_id_seq    SEQUENCE     �   CREATE SEQUENCE public.world_food_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.world_food_id_seq;
       public          postgres    false    219            .           0    0    world_food_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.world_food_id_seq OWNED BY public.world_food.id;
          public          postgres    false    218            ~           2604    16403    capitals id    DEFAULT     j   ALTER TABLE ONLY public.capitals ALTER COLUMN id SET DEFAULT nextval('public.capitals_id_seq'::regclass);
 :   ALTER TABLE public.capitals ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    16435    countries id    DEFAULT     l   ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);
 ;   ALTER TABLE public.countries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221                       2604    16410    flags id    DEFAULT     d   ALTER TABLE ONLY public.flags ALTER COLUMN id SET DEFAULT nextval('public.flags_id_seq'::regclass);
 7   ALTER TABLE public.flags ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    16498    tracker_members id    DEFAULT     x   ALTER TABLE ONLY public.tracker_members ALTER COLUMN id SET DEFAULT nextval('public.tracker_members_id_seq'::regclass);
 A   ALTER TABLE public.tracker_members ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            �           2604    16540    visited_countries id    DEFAULT     |   ALTER TABLE ONLY public.visited_countries ALTER COLUMN id SET DEFAULT nextval('public.visited_countries_id_seq'::regclass);
 C   ALTER TABLE public.visited_countries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    16419    world_food id    DEFAULT     n   ALTER TABLE ONLY public.world_food ALTER COLUMN id SET DEFAULT nextval('public.world_food_id_seq'::regclass);
 <   ALTER TABLE public.world_food ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2606    16405    capitals capitals_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.capitals
    ADD CONSTRAINT capitals_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.capitals DROP CONSTRAINT capitals_pkey;
       public            postgres    false    215            �           2606    16437    countries countries_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    221            �           2606    16414    flags flags_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.flags
    ADD CONSTRAINT flags_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.flags DROP CONSTRAINT flags_pkey;
       public            postgres    false    217            �           2606    16504 )   tracker_members tracker_members_color_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.tracker_members
    ADD CONSTRAINT tracker_members_color_key UNIQUE (color);
 S   ALTER TABLE ONLY public.tracker_members DROP CONSTRAINT tracker_members_color_key;
       public            postgres    false    223            �           2606    16502 $   tracker_members tracker_members_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.tracker_members
    ADD CONSTRAINT tracker_members_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.tracker_members DROP CONSTRAINT tracker_members_pkey;
       public            postgres    false    223            �           2606    16544 >   visited_countries visited_countries_member_id_country_code_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.visited_countries
    ADD CONSTRAINT visited_countries_member_id_country_code_key UNIQUE (member_id, country_code);
 h   ALTER TABLE ONLY public.visited_countries DROP CONSTRAINT visited_countries_member_id_country_code_key;
       public            postgres    false    225    225            �           2606    16542 (   visited_countries visited_countries_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.visited_countries
    ADD CONSTRAINT visited_countries_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.visited_countries DROP CONSTRAINT visited_countries_pkey;
       public            postgres    false    225            �           2606    16421    world_food world_food_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.world_food
    ADD CONSTRAINT world_food_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.world_food DROP CONSTRAINT world_food_pkey;
       public            postgres    false    219            �           2606    16545 2   visited_countries visited_countries_member_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.visited_countries
    ADD CONSTRAINT visited_countries_member_id_fkey FOREIGN KEY (member_id) REFERENCES public.tracker_members(id);
 \   ALTER TABLE ONLY public.visited_countries DROP CONSTRAINT visited_countries_member_id_fkey;
       public          postgres    false    223    3215    225           