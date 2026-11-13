CREATE KEYSPACE IF NOT EXISTS ta_ind_01
WITH replication = {'class': 'NetworkTopologyStrategy', 'datacenter1': 3};

CREATE TABLE IF NOT EXISTS ta_ind_01.prueba (
    id int PRIMARY KEY,
    mensaje text
);
