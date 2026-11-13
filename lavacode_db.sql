CREATE DATABASE saep_db;
\c saep_db

CREATE TABLE usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL
);

CREATE TABLE cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE veiculo (
    id SERIAL PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL,
    cliente_id INTEGER NOT NULL REFERENCES cliente (id)
);

CREATE TABLE agendamento (
    id SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    veiculo_id INTEGER NOT NULL REFERENCES veiculo (id)
);

INSERT INTO usuario (nome, senha) VALUES ('admin', '$2b$10$nyw5TdGMjuvOiGPFN6ccjuPFPtg0fuFjmNTR1D0a5zOd.9zyEy1na');
INSERT INTO usuario (nome, senha) VALUES ('maria', '$2b$10$Jywp/IsWYBuZ/xb24WK93upf9fVoueeF/jduCCy.gim0dez2bjq3W');
INSERT INTO usuario (nome, senha) VALUES ('joao', '$2b$10$MCoE9WkhqtoPFUGX8l.ppu7IT8fzepGYN2HayAYmHQ2uSi1Pu7KAq');

INSERT INTO cliente (nome, cpf) VALUES ('Bagui', '2503fef7147c35e199bffb8ca38bf3a3');
INSERT INTO cliente (nome, cpf) VALUES ('Arthur', '6e55389e0460d7afc4b8885918ae7fe5');
INSERT INTO cliente (nome, cpf) VALUES ('Rafaela', '5bb8ececf477ac1746cd43495b2f6c40');
INSERT INTO cliente (nome, cpf) VALUES ('Gustavo victor', '751183bfce704063488b5e3d70331a8c');

INSERT INTO veiculo (modelo, cliente_id) VALUES ('Corsa', 1);
INSERT INTO veiculo (modelo, cliente_id) VALUES ('Celta', 2);
INSERT INTO veiculo (modelo, cliente_id) VALUES ('Agile', 3);

INSERT INTO agendamento (data, veiculo_id) VALUES ('2026-11-10', 1);
INSERT INTO agendamento (data, veiculo_id) VALUES ('2026-11-11', 2);
INSERT INTO agendamento (data, veiculo_id) VALUES ('2026-11-12', 3);
INSERT INTO agendamento (data, veiculo_id) VALUES ('2026-12-30', 2);
