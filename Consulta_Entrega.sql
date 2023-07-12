------ Consulta SQL

select a.id_coche, b.nombre_modelos, c.nombre_marcas, d.nombre_grupo, fechaCompra, matricula, e.nombreColor, tot_kms, f.nombre_aseguradora, num_poliza_seguro,
from practicaSQL.kcodingCoches a right join practicaSQL.modeloCoches b on a.id_modelo = b.id_modelo
join practicaSQL.marcaCoches c on b.id_marca = c.id_marca
join practicaSQL.grupoCoches d on c.id_grupo = d.id_grupo
left join practicaSQL.colorCoche e on a.id_color = e.id_color
left join practicaSQL.aseguradoras f on a.id_aseguradora = f.id_aseguradora



