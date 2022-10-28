import api from './index';

export default {
  destroyIngredient(id) {
    return api({
      method: 'delete',
      url: `/api/ingredients/${id}`,
    })
  }
}