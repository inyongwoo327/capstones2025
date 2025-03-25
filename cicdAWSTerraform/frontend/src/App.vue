<script lang="ts">
import { defineComponent, ref, onMounted } from "vue";

export default defineComponent({
  setup() {
    const message = ref("Loading...");
    const apiUrl = import.meta.env.VITE_API_URL || "http://localhost:3000"; // Use environment variable or fallback to localhost

    onMounted(async () => {
      try {
        const response = await fetch(`${apiUrl}/`);
        const data = await response.json();
        message.value = data.message;
      } catch (error) {
        message.value = "Error fetching data";
      }
    });

    return { message };
  },
});
</script>

<template>
  <div>
    <h1>{{ message }}</h1>
  </div>
</template>

<style scoped>
h1 {
  color: blue;
}
</style>