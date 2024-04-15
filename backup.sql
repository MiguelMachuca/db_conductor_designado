PGDMP  '                    |            db_conductor_designado    16.2    16.2 M               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16466    db_conductor_designado    DATABASE     �   CREATE DATABASE db_conductor_designado WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
 &   DROP DATABASE db_conductor_designado;
                postgres    false            �            1259    16733    usuario    TABLE     ;  CREATE TABLE public.usuario (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    correo character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    celular character varying(50) NOT NULL,
    fecha_de_nacimiento date NOT NULL,
    genero character varying(20) NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �            1259    16760    cliente    TABLE     ;   CREATE TABLE public.cliente (
)
INHERITS (public.usuario);
    DROP TABLE public.cliente;
       public         heap    postgres    false    216            �            1259    16739 	   conductor    TABLE     �   CREATE TABLE public.conductor (
    numero_de_licencia_de_conducir character varying(50) NOT NULL,
    fecha_de_vencimiento_de_la_licencia date NOT NULL
)
INHERITS (public.usuario);
    DROP TABLE public.conductor;
       public         heap    postgres    false    216            �            1259    16823    metodo_de_pago    TABLE     =  CREATE TABLE public.metodo_de_pago (
    id integer NOT NULL,
    tipo_de_metodo_de_pago character varying(30) NOT NULL,
    numero_tarjeta integer NOT NULL,
    nombre_en_la_tarjeta character varying(50) NOT NULL,
    fecha_vencimiento date NOT NULL,
    cvv_cvc integer NOT NULL,
    id_cliente integer NOT NULL
);
 "   DROP TABLE public.metodo_de_pago;
       public         heap    postgres    false            �            1259    16822    metodo_de_pago_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metodo_de_pago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.metodo_de_pago_id_seq;
       public          postgres    false    230                       0    0    metodo_de_pago_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.metodo_de_pago_id_seq OWNED BY public.metodo_de_pago.id;
          public          postgres    false    229            �            1259    16777 	   promocion    TABLE     �   CREATE TABLE public.promocion (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL,
    descuento double precision NOT NULL,
    id_servicio integer NOT NULL
);
    DROP TABLE public.promocion;
       public         heap    postgres    false            �            1259    16776    promocion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.promocion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.promocion_id_seq;
       public          postgres    false    224                       0    0    promocion_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.promocion_id_seq OWNED BY public.promocion.id;
          public          postgres    false    223            �            1259    16770    servicio    TABLE     �   CREATE TABLE public.servicio (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(100) NOT NULL
);
    DROP TABLE public.servicio;
       public         heap    postgres    false            �            1259    16769    servicio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.servicio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.servicio_id_seq;
       public          postgres    false    222                       0    0    servicio_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.servicio_id_seq OWNED BY public.servicio.id;
          public          postgres    false    221            �            1259    16789    solicitar_servicio    TABLE     �   CREATE TABLE public.solicitar_servicio (
    id integer NOT NULL,
    id_cliente integer NOT NULL,
    id_servicio integer NOT NULL
);
 &   DROP TABLE public.solicitar_servicio;
       public         heap    postgres    false            �            1259    16788    solicitar_servicio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.solicitar_servicio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.solicitar_servicio_id_seq;
       public          postgres    false    226                       0    0    solicitar_servicio_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.solicitar_servicio_id_seq OWNED BY public.solicitar_servicio.id;
          public          postgres    false    225            �            1259    16835    transacciones    TABLE     �   CREATE TABLE public.transacciones (
    id integer NOT NULL,
    id_viaje integer NOT NULL,
    fecha date NOT NULL,
    monto double precision NOT NULL,
    estado character varying(30) NOT NULL,
    id_metodo integer NOT NULL
);
 !   DROP TABLE public.transacciones;
       public         heap    postgres    false            �            1259    16834    transacciones_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transacciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.transacciones_id_seq;
       public          postgres    false    232                       0    0    transacciones_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.transacciones_id_seq OWNED BY public.transacciones.id;
          public          postgres    false    231            �            1259    16732    usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.usuario_id_seq;
       public          postgres    false    216                       0    0    usuario_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;
          public          postgres    false    215            �            1259    16749    vehiculo    TABLE       CREATE TABLE public.vehiculo (
    id integer NOT NULL,
    modelo character varying(50) NOT NULL,
    marca character varying(50) NOT NULL,
    placa character varying(30) NOT NULL,
    numero_de_seguro integer NOT NULL,
    id_conductor integer NOT NULL
);
    DROP TABLE public.vehiculo;
       public         heap    postgres    false            �            1259    16748    vehiculo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vehiculo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.vehiculo_id_seq;
       public          postgres    false    219                       0    0    vehiculo_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.vehiculo_id_seq OWNED BY public.vehiculo.id;
          public          postgres    false    218            �            1259    16806    viajes    TABLE     A  CREATE TABLE public.viajes (
    id integer NOT NULL,
    id_conductor integer NOT NULL,
    id_solicitud integer NOT NULL,
    fecha date NOT NULL,
    origen character varying(100) NOT NULL,
    destinos character varying(150) NOT NULL,
    costo double precision NOT NULL,
    estado character varying(30) NOT NULL
);
    DROP TABLE public.viajes;
       public         heap    postgres    false            �            1259    16805    viajes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.viajes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.viajes_id_seq;
       public          postgres    false    228                       0    0    viajes_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.viajes_id_seq OWNED BY public.viajes.id;
          public          postgres    false    227            H           2604    16851 
   cliente id    DEFAULT     h   ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);
 9   ALTER TABLE public.cliente ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    215            F           2604    16852    conductor id    DEFAULT     j   ALTER TABLE ONLY public.conductor ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);
 ;   ALTER TABLE public.conductor ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    215            M           2604    16853    metodo_de_pago id    DEFAULT     v   ALTER TABLE ONLY public.metodo_de_pago ALTER COLUMN id SET DEFAULT nextval('public.metodo_de_pago_id_seq'::regclass);
 @   ALTER TABLE public.metodo_de_pago ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            J           2604    16854    promocion id    DEFAULT     l   ALTER TABLE ONLY public.promocion ALTER COLUMN id SET DEFAULT nextval('public.promocion_id_seq'::regclass);
 ;   ALTER TABLE public.promocion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            I           2604    16855    servicio id    DEFAULT     j   ALTER TABLE ONLY public.servicio ALTER COLUMN id SET DEFAULT nextval('public.servicio_id_seq'::regclass);
 :   ALTER TABLE public.servicio ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            K           2604    16856    solicitar_servicio id    DEFAULT     ~   ALTER TABLE ONLY public.solicitar_servicio ALTER COLUMN id SET DEFAULT nextval('public.solicitar_servicio_id_seq'::regclass);
 D   ALTER TABLE public.solicitar_servicio ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            N           2604    16857    transacciones id    DEFAULT     t   ALTER TABLE ONLY public.transacciones ALTER COLUMN id SET DEFAULT nextval('public.transacciones_id_seq'::regclass);
 ?   ALTER TABLE public.transacciones ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232            E           2604    16858 
   usuario id    DEFAULT     h   ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);
 9   ALTER TABLE public.usuario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            G           2604    16859    vehiculo id    DEFAULT     j   ALTER TABLE ONLY public.vehiculo ALTER COLUMN id SET DEFAULT nextval('public.vehiculo_id_seq'::regclass);
 :   ALTER TABLE public.vehiculo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            L           2604    16860 	   viajes id    DEFAULT     f   ALTER TABLE ONLY public.viajes ALTER COLUMN id SET DEFAULT nextval('public.viajes_id_seq'::regclass);
 8   ALTER TABLE public.viajes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            �          0    16760    cliente 
   TABLE DATA           e   COPY public.cliente (id, nombre, correo, password, celular, fecha_de_nacimiento, genero) FROM stdin;
    public          postgres    false    220   �]       �          0    16739 	   conductor 
   TABLE DATA           �   COPY public.conductor (id, nombre, correo, password, celular, fecha_de_nacimiento, genero, numero_de_licencia_de_conducir, fecha_de_vencimiento_de_la_licencia) FROM stdin;
    public          postgres    false    217   �]                 0    16823    metodo_de_pago 
   TABLE DATA           �   COPY public.metodo_de_pago (id, tipo_de_metodo_de_pago, numero_tarjeta, nombre_en_la_tarjeta, fecha_vencimiento, cvv_cvc, id_cliente) FROM stdin;
    public          postgres    false    230   ^                 0    16777 	   promocion 
   TABLE DATA           T   COPY public.promocion (id, nombre, descripcion, descuento, id_servicio) FROM stdin;
    public          postgres    false    224   %^                  0    16770    servicio 
   TABLE DATA           ;   COPY public.servicio (id, nombre, descripcion) FROM stdin;
    public          postgres    false    222   B^                 0    16789    solicitar_servicio 
   TABLE DATA           I   COPY public.solicitar_servicio (id, id_cliente, id_servicio) FROM stdin;
    public          postgres    false    226   _^       
          0    16835    transacciones 
   TABLE DATA           V   COPY public.transacciones (id, id_viaje, fecha, monto, estado, id_metodo) FROM stdin;
    public          postgres    false    232   |^       �          0    16733    usuario 
   TABLE DATA           e   COPY public.usuario (id, nombre, correo, password, celular, fecha_de_nacimiento, genero) FROM stdin;
    public          postgres    false    216   �^       �          0    16749    vehiculo 
   TABLE DATA           \   COPY public.vehiculo (id, modelo, marca, placa, numero_de_seguro, id_conductor) FROM stdin;
    public          postgres    false    219   �^                 0    16806    viajes 
   TABLE DATA           h   COPY public.viajes (id, id_conductor, id_solicitud, fecha, origen, destinos, costo, estado) FROM stdin;
    public          postgres    false    228   �^                  0    0    metodo_de_pago_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.metodo_de_pago_id_seq', 1, false);
          public          postgres    false    229                       0    0    promocion_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.promocion_id_seq', 1, false);
          public          postgres    false    223                       0    0    servicio_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.servicio_id_seq', 1, false);
          public          postgres    false    221                       0    0    solicitar_servicio_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.solicitar_servicio_id_seq', 1, false);
          public          postgres    false    225                       0    0    transacciones_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.transacciones_id_seq', 1, false);
          public          postgres    false    231                       0    0    usuario_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuario_id_seq', 1, false);
          public          postgres    false    215                       0    0    vehiculo_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.vehiculo_id_seq', 1, false);
          public          postgres    false    218                        0    0    viajes_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.viajes_id_seq', 1, false);
          public          postgres    false    227            \           2606    16828 "   metodo_de_pago metodo_de_pago_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.metodo_de_pago
    ADD CONSTRAINT metodo_de_pago_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.metodo_de_pago DROP CONSTRAINT metodo_de_pago_pkey;
       public            postgres    false    230            V           2606    16782    promocion promocion_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.promocion
    ADD CONSTRAINT promocion_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.promocion DROP CONSTRAINT promocion_pkey;
       public            postgres    false    224            T           2606    16775    servicio servicio_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.servicio DROP CONSTRAINT servicio_pkey;
       public            postgres    false    222            X           2606    16794 *   solicitar_servicio solicitar_servicio_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.solicitar_servicio
    ADD CONSTRAINT solicitar_servicio_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.solicitar_servicio DROP CONSTRAINT solicitar_servicio_pkey;
       public            postgres    false    226            ^           2606    16840     transacciones transacciones_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.transacciones
    ADD CONSTRAINT transacciones_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.transacciones DROP CONSTRAINT transacciones_pkey;
       public            postgres    false    232            P           2606    16738    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    216            R           2606    16754    vehiculo vehiculo_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT vehiculo_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.vehiculo DROP CONSTRAINT vehiculo_pkey;
       public            postgres    false    219            Z           2606    16811    viajes viajes_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.viajes
    ADD CONSTRAINT viajes_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.viajes DROP CONSTRAINT viajes_pkey;
       public            postgres    false    228            a           2606    16764    cliente cliente_id_fkey    FK CONSTRAINT     s   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_id_fkey FOREIGN KEY (id) REFERENCES public.usuario(id);
 A   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_id_fkey;
       public          postgres    false    4688    216    220            _           2606    16743    conductor conductor_id_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.conductor
    ADD CONSTRAINT conductor_id_fkey FOREIGN KEY (id) REFERENCES public.usuario(id);
 E   ALTER TABLE ONLY public.conductor DROP CONSTRAINT conductor_id_fkey;
       public          postgres    false    217    216    4688            g           2606    16829 -   metodo_de_pago metodo_de_pago_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.metodo_de_pago
    ADD CONSTRAINT metodo_de_pago_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.usuario(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 W   ALTER TABLE ONLY public.metodo_de_pago DROP CONSTRAINT metodo_de_pago_id_cliente_fkey;
       public          postgres    false    4688    230    216            b           2606    16783 $   promocion promocion_id_servicio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.promocion
    ADD CONSTRAINT promocion_id_servicio_fkey FOREIGN KEY (id_servicio) REFERENCES public.servicio(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 N   ALTER TABLE ONLY public.promocion DROP CONSTRAINT promocion_id_servicio_fkey;
       public          postgres    false    224    222    4692            c           2606    16795 5   solicitar_servicio solicitar_servicio_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.solicitar_servicio
    ADD CONSTRAINT solicitar_servicio_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.usuario(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 _   ALTER TABLE ONLY public.solicitar_servicio DROP CONSTRAINT solicitar_servicio_id_cliente_fkey;
       public          postgres    false    216    4688    226            d           2606    16800 6   solicitar_servicio solicitar_servicio_id_servicio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.solicitar_servicio
    ADD CONSTRAINT solicitar_servicio_id_servicio_fkey FOREIGN KEY (id_servicio) REFERENCES public.servicio(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 `   ALTER TABLE ONLY public.solicitar_servicio DROP CONSTRAINT solicitar_servicio_id_servicio_fkey;
       public          postgres    false    226    4692    222            h           2606    16846 *   transacciones transacciones_id_metodo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transacciones
    ADD CONSTRAINT transacciones_id_metodo_fkey FOREIGN KEY (id_metodo) REFERENCES public.metodo_de_pago(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 T   ALTER TABLE ONLY public.transacciones DROP CONSTRAINT transacciones_id_metodo_fkey;
       public          postgres    false    232    4700    230            i           2606    16841 )   transacciones transacciones_id_viaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transacciones
    ADD CONSTRAINT transacciones_id_viaje_fkey FOREIGN KEY (id_viaje) REFERENCES public.viajes(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 S   ALTER TABLE ONLY public.transacciones DROP CONSTRAINT transacciones_id_viaje_fkey;
       public          postgres    false    228    4698    232            `           2606    16755 #   vehiculo vehiculo_id_conductor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehiculo
    ADD CONSTRAINT vehiculo_id_conductor_fkey FOREIGN KEY (id_conductor) REFERENCES public.usuario(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 M   ALTER TABLE ONLY public.vehiculo DROP CONSTRAINT vehiculo_id_conductor_fkey;
       public          postgres    false    216    4688    219            e           2606    16812    viajes viajes_id_conductor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.viajes
    ADD CONSTRAINT viajes_id_conductor_fkey FOREIGN KEY (id_conductor) REFERENCES public.usuario(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 I   ALTER TABLE ONLY public.viajes DROP CONSTRAINT viajes_id_conductor_fkey;
       public          postgres    false    228    4688    216            f           2606    16817    viajes viajes_id_solicitud_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.viajes
    ADD CONSTRAINT viajes_id_solicitud_fkey FOREIGN KEY (id_solicitud) REFERENCES public.solicitar_servicio(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 I   ALTER TABLE ONLY public.viajes DROP CONSTRAINT viajes_id_solicitud_fkey;
       public          postgres    false    226    228    4696            �      x������ � �      �      x������ � �            x������ � �            x������ � �             x������ � �            x������ � �      
      x������ � �      �      x������ � �      �      x������ � �            x������ � �     