<template>
  <div>
  <div class="search resultSearch">
    <form action="search" class="search-container">

      <input type="text" class="form-control" name="search" v-model="search">


      <input hidden name="tag" value="" id="tag_input">
      <button type="submit" class="button search-icon">
        <img src="resources\pic\search.png" alt="">
      </button>
    </form>


  </div>
  <!--<div class="search_result" v-if="answer !== null">-->

    <!--<div class="result" v-for="book in answer.books " :id="book.id">-->
      <!--<div class="media">-->
        <!--{{book.name}}-->
      <!--</div>-->
    <!--</div>-->
  <!--</div>-->
  </div>
</template>

<script>
    export default {
      name: "search-component"
    }
</script>

<style scoped>

</style>
