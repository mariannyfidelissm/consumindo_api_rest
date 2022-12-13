//Imports
const express = require("express");
const routes = express.Router();

// Controllers
const TarefaController = require("./controllers/TarefaController");

// System
routes.get("/", (req, res) => {
  res.send({ name: "Exemplo sistema CRUD Tarefas", version: "v0" });
});

routes.get("/tarefas", TarefaController.index);
routes.post("/tarefa/create", TarefaController.create);
routes.put("/tarefa/:id/update", TarefaController.update);
routes.delete("/tarefa/:id/delete", TarefaController.delete);

// Export
module.exports = routes;
