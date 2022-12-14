import { CriteriaBuilder } from "../../compartido/dominio/criteria/CriteriaBuilder.js";

export default class ConsultarReportesSiniestroPorAsignacion {
  constructor(repositorio) {
    this._repositorio = repositorio;
  }

  run = (idEmpleado) =>
    new Promise((resolve, reject) => {
      let criteria = new CriteriaBuilder()
        .equal("idEmpleado", idEmpleado)
        .obligatory()
        .build();

      this._repositorio
        .buscar(criteria)
        .then((reportes) => {
          resolve(reportes);
        })
        .catch((error) => reject(error));
    });
}
