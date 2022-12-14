import { Router } from "express";
import { query } from "express-validator";
import validarCampos from "../../../compartido/infrestructura/utils/ValidarCampos.js";
import consultarMarcasController from "./ConsultarMarcasController.js";

export default class IndexMarcaControllers {
  constructor() {
    this.routers = Router();
  }

  loadControllers() {
    this.routers.get(
      "/marcas",
      [query(["limit", "offset"]).optional().isInt(), validarCampos],
      consultarMarcasController
    );
  }
}
