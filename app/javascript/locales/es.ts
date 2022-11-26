export default {
  buttons: {
    save: 'Guardar',
    add: 'Añadir',
    cancel: 'Cancelar',
    delete: 'Eliminar',
    edit: 'Editar',
  },
  user: {
    title: 'Usuario',
  },
  users: {
    email: 'Correo electrónico',
    email_placeholder: 'Ingresa tu correo electrónico',
    password: 'Contraseña',
    password_placeholder: 'Ingresa tu contraseña',
    password_confirmation: 'Confirmar contraseña',
    password_confirmation_placeholder: 'Vuelve a ingresar tu contraseña',
    sign_in: 'Iniciar sesión',
    sign_up: 'Registrarse',
  },
  clients: {
    title: 'Clientes',
    full_name: 'Nombre completo',
    email: 'Correo electrónico',
    password: 'Contraseña',
    password_confirmation: 'Confirmar contraseña',
    last_visited: 'Última visita',
    never_visited: 'Nunca visitado',
    actions: {
      show: 'Ver cliente',
      add: 'Añadir cliente',
      edit: 'Editar cliente',
      delete: 'Eliminar cliente',
    },
    new: {
      title: 'Añadir cliente',
      full_name: 'Nombre completo',
      email: 'Correo electrónico',
      password: 'Contraseña',
      password_confirmation: 'Confirmar contraseña',
      placeholder: {
        full_name: 'Ingresa el nombre completo',
        email: 'Ingresa el correo electrónico',
        password: 'Ingresa la contraseña',
        password_confirmation: 'Vuelve a ingresar la contraseña',
      },
      button: 'Añadir cliente',
    },
    edit: {
      title: 'Editar cliente',
      button: 'Editar cliente',
    }
  },
  session: {
    signin: 'Iniciar sesión',
    signout: 'Cerrar sesión',
    signup: 'Registrarse'
  },
  home: {
    title: 'Inicio',
  },
  inventory:{
    title: 'Inventario',
  },
  items: {
    title: 'Inventario',
    name: 'Nombre',
    stock: 'Stock item',
    show: {
      button: 'Ver',
    },
    new: {
      title: 'Nuevo item',
      name: 'Nombre',
      stock: 'Stock',
      price: 'Precio',
      placeholder: {
        name: 'Ingresa el nombre del item',
        stock: 'Ingresa el stock del item',
        price: 'Ingresa el precio del item',
      }
    },
    add: {
      title: 'Pedir stock',
      button: 'Pedir stock',
      stock: 'Stock',
      placeholder: {
        stock: 'Ingresa el stock a pedir',
      },
    }

  },
  menu:{
    title: 'Menú',
  },
  menus: {
    id: 'ID',
    name: 'Nombre',
    default: 'Menú por defecto',
    actions: {
      show: 'Ver menú',
      add: 'Añadir menú',
      edit: 'Editar menú',
      delete: 'Eliminar menú',
    },
    new: {
      title: 'Nuevo menú',
      name: 'Titulo menú',
      description: 'Descripción',
      default: 'Menú por defecto',
      placeholder: {
        name: 'Ingresa el nombre del menú',
        description: 'Ingresa la descripción del menú',
      },
    button: 'Crear menú',
    },
    edit: {
      title: 'Editar menú',
      button: 'Editar'
    },
    title: 'Menús',
  },
  recipes: {
    title: "Recetas",
    edit: {
      title: "Editar receta",
    },
    new: {
      title: "Nueva receta",
      name: "Nombre de la receta",
      description: "Descripción",
      preparation: "Preparación",
      placeholder: {
        name: "Nombre de la receta",
        description: "Descripción de la receta",
        quantity: "Cantidad del ingrediente",
        unit: 'Unidad de medida',
      },
      ingredients: {
        title: "Ingredientes",
        subtitle: "Ingrediente",
        name: "Nombre",
        quantity: "Cantidad",
        unit: "Unidad",
      },
    },
    show: {
      button: "Ver receta",
      edit: "Editar receta",
      delete: "Eliminar receta",
    },
  },
  tables: {
    title: "Mesas",
    table_number: 'Número de mesa',
    seats_number: 'Cantidad de sillas',
    reserved_at: 'Reservada',
    new: {
      title: 'Nueva mesa',
      table_number: 'Número de mesa',
      seats: 'Cantidad de sillas',
      placeholder: {
        table_number: 'Ingresa el número de mesa',
        seats: 'Ingresa la cantidad de sillas',
      },
      button: 'Crear mesa',
    },
    edit: {
      title: 'Editar mesa',
      button: 'Editar',
    },
    actions: {
      show: 'Ver mesa',
      add: 'Añadir mesa',
      edit: 'Editar mesa',
      delete: 'Eliminar mesa',
    }
  },
  reservation: {
    title: 'Reserva',
    table: {
      title: 'Mesa',
      number: 'Número',
      seats: 'Cantidad de sillas',
    },
    client: {
      title: 'Cliente',
      full_name: 'Nombre completo',
      email: 'Correo electrónico',
    },
    information: {
      title: 'Información',
      datetime: 'Fecha y hora',
      status: 'Estado',
      number_of_people: 'Cantidad de personas',
      date: 'Fecha',
      time: 'Hora',
    },
    table_number: 'Número de mesa',
    seats: 'Cantidad de sillas',
    reservation_datetime: 'Fecha y hora de reserva',
    number_of_people: 'Cantidad de personas',
  },
  reservations: {
    id: 'ID',
    title: "Reservaciones",
    reservation_datetime: 'Fecha y hora de la reservación',
    client: 'Cliente',
    status: 'Estado',
    actions: {
      show: 'Ver reserva',
      add: 'Añadir reserva',
      edit: 'Editar reserva',
      delete: 'Eliminar reserva',
    },
    statuses: {
      active: 'Activa',
      cancelled: 'Cancelada',
      finished: 'Finalizada',
      filed:'Archivada',
      scheduled: 'Agendada',
    },
    new: {
      table: 'Mesa',
      client: 'Cliente',
      reservation_datetime: 'Fecha y hora de la reservación',
      number_of_people: 'Cantidad de personas',
      status: 'Estado',
      placeholder: {
        table: 'Selecciona la mesa',
        client: 'Selecciona el cliente',
        reservation_datetime: 'Selecciona la fecha y hora de la reservación',
        number_of_people: 'Ingresa la cantidad de personas',
      },
    },
    edit: {
      title: 'Editar reserva',
      button: 'Editar',
    }
  },
  finances: {
    title: "Finanzas",
    incomes: {
      title: "Ingresos",
    },
    expenses:{
      title: "Gastos",
      expense: {
        id: 'ID',
        title: "Gasto",
        amount: "Monto",
        description: "Descripción",
        date: "Fecha",

      }
    },
    revenue: 'Ingresos',
    totalExpenses: 'Gastos totales',
    totalIncomes: 'Ingresos totales',
  },
  actions: {
    title: "Acciones",
    back: 'Atrás',
    continue: 'Continuar',
    selectOption: 'Seleccionar opción',
    yes: 'Si',
    no: 'No',
  },
  kitchens:{
    orders:{
      active_orders: {
        title: 'Pedidos activos',
      }
    },
    title: 'Cocinas',
  },
  expenses: {
    title: "Gastos",
    show: {
      title: "Gasto Número",
      description: "Descripción",
      total: "Monto",
      items: {
        title: "Items",
      }
    }
  },
}