const knex = require('../database')

// Controller
module.exports = {
    // Index
    async index(req, res) {
        
      const query = knex.select('id', 'name', 'description').from('tarefas')
  
      query
        .orderBy([{ column: 'name', order: 'asc' }])
        .then((tarefa) => res.send(tarefa))
    },
  
    // Create
    async create(req, res) {
      try {
        let { name, description } = req.body
  
        const [id] = await knex('tarefas')
          .insert({
            name,
            description
          })
          .returning('id')
  
        return res.json({ id })
      } catch (err) {
        return res.status(404).json({
          success: false,
          message: 'tarefa.create.nok'
        })
      }
    },
  
    // Update
    async update(req, res) {
      const { id } = req.params
      let { name, description } = req.body
  
      try {
        await knex('tarefas').update({ name, description }).where({ id })
  
        return res.status(200).send({
          success: true,
          message: 'tarefa.update.ok'
        })
      } catch (err) {
        console.log(err)
        return res.status(400).send({
          success: false,
          message: 'tarefa.update.nok'
        })
      }
    },
  
    // DELETE
    async delete(req, res) {
      const { id } = req.params
  
      try {
        await knex('tarefas').where('id', id).del()
  
        return res.status(200).send({
          success: true,
          message: 'tarefa.delete.ok'
        })
      } catch (err) {
        res.status(400).send({
          success: false,
          message: 'tarefa.delete.nok'
        })
      }
    }
  }