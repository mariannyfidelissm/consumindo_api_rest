/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function(knex) {
    console.log('Migration: TAREFAS')

    return knex.schema.createTable('tarefas', function (table) {
      table.increments('id').primary()
  
      table.string('name', 100).notNullable()
      table.string('description', 255).notNullable()
  
      table.timestamp('created_at').notNullable().defaultTo(knex.fn.now())
      table.timestamp('updated_at').notNullable().defaultTo(knex.fn.now())
    })
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function(knex) {
    return knex.schema.dropTable('tarefas')
};
