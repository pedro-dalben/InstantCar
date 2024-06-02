<template>
  <div class="card p-3">
    <div class="card-body">
      <form @submit.prevent="handleSubmit">
        <div class="form-group">
          <label for="brand">Brand</label>
          <input type="text" id="brand" v-model="vehicle.brand" class="form-control" required>
        </div>
        <div class="form-group mt-3">
          <label for="category">Category</label>
          <input type="text" id="category" v-model="vehicle.category" class="form-control" required>
        </div>
        <div class="form-group  mt-3">
          <label for="model">Model</label>
          <input type="text" id="model" v-model="vehicle.model" class="form-control" required>
        </div>
        <div class="form-group mt-3">
          <label for="license_plate">License Plate</label>
          <input type="text" id="license_plate" v-model="vehicle.license_plate" class="form-control" required>
        </div>
        <div class="form-group mt-3">
          <label for="available">vailable for Rent</label>
          <input type="checkbox" id="available" v-model="vehicle.available" class="form-control form-check-input" required>
        </div>
        <button type="submit" class="btn btn-primary mt-3">Save</button>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    vehicle: {
      type: Object,
      default: () => ({
        brand: '',
        category: '',
        model: '',
        license_plate: ''
      })
    },
    onSubmit: {
      type: Function,
      required: true
    }
  },
  methods: {
    handleSubmit() {
      this.onSubmit(this.vehicle)
    }
  }
}
</script>
