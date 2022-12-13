/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> } 
 
exports.seed = async function(knex) {
  // Deletes ALL existing entries
  await knex('table_name').del()
  await knex('table_name').insert([
    {id: 1, colName: 'rowValue1'},
    {id: 2, colName: 'rowValue2'},
    {id: 3, colName: 'rowValue3'}
  ]);
};
*/
exports.seed = async function (knex) {
  console.log('Seed: TAREFAS')

  await knex('tarefas').del()
  await knex('tarefas').insert([
    {
      name: 'Implementar API Node',
      description:
        'Terminar implementação do Knex'
    },
    {
      name: 'Implementar APP Flutter',
      description:
        'Implementar a tela de consulta a API'
    },
  ]
  )
}
