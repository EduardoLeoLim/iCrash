import { Request, TYPES } from "tedious";
import SqlServerCriteriaParser from "../../../compartido/infrestructura/utils/SqlServerCriteriaParser.js";
import Plazo from "../../dominio/Plazo.js";

export default class SqlServerPlazoRepositorio {
  constructor(conexion) {
    this.conexion = conexion;
  }

  buscar = (criteria) =>
    new Promise((resolve, reject) => {
      let plazos = [];

      let criteriaParser = new SqlServerCriteriaParser([], "Plazo", criteria);
      let { consulta, parameters } = criteriaParser.parse();

      console.log(consulta);

      let request = new Request(consulta, (err, rowCount) => {
        if (err) {
          console.log("Error PlazoRepositorio: " + err);
          reject(new Error("Error base de datos"));
        } else {
          console.log(rowCount + " filas");
          resolve(plazos);
        }
      });

      parameters.forEach((parameter) => {
        request.addParameter(
          parameter.get("param"),
          TYPES.VarChar,
          parameter.get("value")
        );
      });

      request.on("row", (columnas) => {
        let plazo = new Plazo();
        for (let name in columnas) {
          plazo[name] = columnas[name].value;
        }
        plazos.push(plazo);
      });

      this.conexion.execSql(request);
    });
}
