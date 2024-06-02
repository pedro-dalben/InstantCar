<template>
  <form @submit.prevent="submitForm">
    <div class="form-group">
      <label for="brand">Brand</label>
      <input
        type="text"
        v-model="form.brand"
        class="form-control"
        id="brand"
        required
      />
    </div>
    <div class="form-group">
      <label for="category">Category</label>
      <input
        type="text"
        v-model="form.category"
        class="form-control"
        id="category"
        required
      />
    </div>
    <div class="form-group">
      <label for="model">Model</label>
      <input
        type="text"
        v-model="form.model"
        class="form-control"
        id="model"
        required
      />
    </div>
    <div class="form-group">
      <label for="plate">Plate</label>
      <input
        type="text"
        v-model="form.plate"
        class="form-control"
        id="plate"
        required
      />
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</template>

<script>
export default {
  props: {
    vehicle: {
      type: Object,
      default: () => ({}),
    },
  },
  data() {
    return {
      form: {
        brand: this.vehicle.brand || '',
        category: this.vehicle.category || '',
        model: this.vehicle.model || '',
        plate: this.vehicle.plate || '',
      },
    }
  },
  methods: {
    submitForm() {
      this.$emit('submit', this.form)
    },
  },
}
</script>
