-- KELAS
CREATE TABLE kelas (
    id_kelas    serial,
    nama_kelas  VARCHAR(20) NOT NULL
);

ALTER TABLE kelas ADD CONSTRAINT kelas_pk PRIMARY KEY ( id_kelas );

-- insert data kelas
insert into kelas(nama_kelas)
values('Lambatan'),('Cepatan'),('Saringan')

-- PEGAWAI
CREATE TABLE guru (
    id_santri           serial,
    nama_santri         VARCHAR(30) NOT NULL,
    nomor_induk_santri  VARCHAR(15) NOT NULL,
    alamat_santri       VARCHAR(50) NOT NULL,
    id_kelas            SMALLINT NOT NULL
);

ALTER TABLE santri ADD CONSTRAINT santri_pk PRIMARY KEY ( id_santri );

ALTER TABLE santri ADD CONSTRAINT santri_nis_santri_un UNIQUE ( nomor_induk_santri );

ALTER TABLE santri
    ADD CONSTRAINT santri_kelas_fk FOREIGN KEY ( id_kelas )
        REFERENCES kelas ( id_kelas );

-- insert data santri
insert into santri(nama_santri,nomor_induk_santri, alamat_santri, id_kelas)
values('Tegar Dwi Pangestu','202410103010', 'jalan-jalan no 60 Jember', 1),
('Suleman Candra Kusuma','202410103035', 'jalan katamso no 71 Probolinggo', 2),
('Ahmad Aziz Setiawan','202410103020', 'jalan raya no 10 Bali', 2)

-- GURU
CREATE TABLE guru (
    id_guru             serial,
    nama_guru           VARCHAR(30) NOT NULL,
    nomor_induk_guru    VARCHAR(15) NOT NULL,
    alamat_guru         VARCHAR(50) NOT NULL,
    id_kelas            SMALLINT NOT NULL
);

ALTER TABLE guru ADD CONSTRAINT guru_pk PRIMARY KEY ( id_guru );

ALTER TABLE guru ADD CONSTRAINT guru_nig_guru_un UNIQUE ( nomor_induk_guru );

ALTER TABLE guru
    ADD CONSTRAINT guru_kelas_fk FOREIGN KEY ( id_kelas )
        REFERENCES kelas ( id_kelas );


-- insert data guru
insert into guru(nama_guru,nomor_induk_guru, alamat_guru, id_kelas)
values('Anang Hermansyah','198030306061', 'jalan apa aja no 56 Jember', 1),
('Siti Nur Zulaeha','198030306062', 'jalan kelapa sawit no 17 Jember', 2),
('Ahmad Dahlan','198030306063', 'jalan lurus no 5 Jember', 3)


-- KEGIATAN
CREATE TABLE kegiatan (
    id_kegiatan        		 serial,
    nama_kegiatan      		 VARCHAR(30) NOT NULL,
	keterangan_kegiatan      VARCHAR(100) NOT NULL
);

ALTER TABLE kegiatan ADD CONSTRAINT kegiatan_pk PRIMARY KEY ( id_kegiatan );

-- insert data kelas
insert into kegiatan(nama_kegiatan, keterangan_kegiatan)
values('mengaji', 'Mendalami ilmu dalam membaca al-quran'),
('Bersih-Bersih', 'Melakukan pembersihan'),
('Evaluasi', 'Melakukan evaluasi materi yang dipelajari'),
('Apel Malam', 'Kegiatan ibadah malam')

select * from kegiatan


-- PRESENSI
CREATE TABLE presensi (
    id_presensi         serial,
    id_kegiatan         SMALLINT NOT NULL,
    id_guru             SMALLINT NOT NULL,
    id_santri           SMALLINT NOT NULL,
    status_kehadiran    ENUM ('hadir', 'alpha', 'ijin'),
    tanggal_presensi    DATE NOT NULL
);

ALTER TABLE presensi ADD CONSTRAINT presensi_pk PRIMARY KEY ( id_presensi );
ALTER TABLE presensi
    ADD CONSTRAINT id_kegiatan_fk FOREIGN KEY ( id_kegiatan )
        REFERENCES kegiatan ( id_kegiatan );
    ADD CONSTRAINT id_santri_fk FOREIGN KEY ( id_santri )
        REFERENCES santri ( id_santri );
    ADD CONSTRAINT id_guru_fk FOREIGN KEY ( id_guru )
        REFERENCES guru ( id_guru );

-- PRESENSI
CREATE TABLE presensi (
    id_presensi         serial,
    id_kegiatan         SMALLINT NOT NULL,
    id_guru             SMALLINT NOT NULL,
    id_santri           SMALLINT NOT NULL,
    status_kehadiran    VARCHAR(10) NOT NULL,
    tanggal_presensi    DATE NOT NULL
);

ALTER TABLE presensi ADD CONSTRAINT presensi_pk PRIMARY KEY ( id_presensi );
ALTER TABLE presensi
    ADD CONSTRAINT id_kegiatan_fk FOREIGN KEY ( id_kegiatan )
        REFERENCES kegiatan ( id_kegiatan );
ALTER TABLE presensi
    ADD CONSTRAINT id_santri_fk FOREIGN KEY ( id_santri )
        REFERENCES santri ( id_santri );
ALTER TABLE presensi
    ADD CONSTRAINT id_guru_fk FOREIGN KEY ( id_guru )
        REFERENCES guru ( id_guru );

-- insert data presensi
insert into presensi(id_kegiatan, id_guru, id_santri, status_kehadiran, tanggal_presensi)
values('1', '1', '2', 'hadir', '2022-06-10'),
('1', '1', '1', 'ijin', '2022-06-10'),
('1', '1', '3', 'alpha', '2022-06-10'),
('3', '1', '3', 'alpha', '2022-06-10'),
('2', '1', '3', 'alpha', '2022-06-10'),

select nama_kegiatan, nama_guru, nama_santri, status_kehadiran, tanggal_presensi from presensi inner join kegiatan on presensi.id_kegiatan = kegiatan.id_kegiatan inner join guru on presensi.id_guru = guru.id_guru inner join santri on presensi.id_santri = santri.id_santri


-- querry kanggo arek seng alpha
select nama_kegiatan, nama_guru, nama_santri, status_kehadiran, tanggal_presensi from presensi inner join kegiatan on presensi.id_kegiatan = kegiatan.id_kegiatan inner join guru on presensi.id_guru = guru.id_guru inner join santri on presensi.id_santri = santri.id_santri where status_kehadiran='alpha' and nama_kegiatan='Evaluasi' and tanggal_presensi='2022-06-10'
