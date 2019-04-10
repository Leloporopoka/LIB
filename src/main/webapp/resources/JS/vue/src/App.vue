<template>
  <div id="app">
    <div class="search resultSearch">
      <form action="search" class="search-container">

        <input type="text" class="form-control" name="search" v-model="search">


        <input hidden name="tag" value="" id="tag_input">
        <button type="submit" class="button search-icon">
          <img src="resources\pic\search.png" alt="">
        </button>
        <!--<c:if test="${!(tag.equals(''))}">-->
        <!--<div class="delete">-->
        <!--<div class="search_tag">-->
        <!--<span>${tag} <button id="tag_close">x</button></span>-->
        <!--</div>-->
        <!--</div>-->
        <!--</c:if>-->
      </form>


    </div>
    <div class="search_result" v-if="answer !== null">

      <div class="result" v-for="book in answer.books " :id="book.id">
      <div class="media">
        {{book.name}}
      </div>
      </div>
      <!--<a href="book/${book.id}">-->
      <!--<img height="150px" width="100px" src="data:image/jpeg;base64,${book.base64}">-->
      <!--</a>-->
      <!--<div class="media-body">-->
      <!--<a href="book/${book.id}"><h3>${book.name}</h3></a>-->
      <!--<p>By ${book.author}</p>-->
      <!--<p>${book.edition} edition</p>-->
      <!--</div>-->
      <!--<div class="available">-->
      <!--<c:choose>-->
      <!--<c:when test="${book.amount==0}">-->
      <!--<span>X</span>-->
      <!--Not available-->
      <!--</c:when>-->
      <!--<c:otherwise>-->
      <!--<span>&#10003</span>-->
      <!--Available-->
      <!--</c:otherwise>-->
      <!--</c:choose>-->
      <!--</div>-->
      <!--</div>-->
      <!--</div>-->

    </div>
  </div>
</template>

<script>
export default {
  name: 'app',
  data () {
    return {
      answer: null,
      search:null

    }
  },
  mounted() {
    this.loadData(location.href);
  },
  methods: {
    loadData(url) {
      axios.get(url).then(response => {
        this.answer = response.data;
      });
    }
  }
}
</script>

<style>

</style>
