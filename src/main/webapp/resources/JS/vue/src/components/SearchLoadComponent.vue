<template>
    <div>
    <div class="search resultSearch">
        <form action="search" class="search-container">
            <input type="text" class="form-control" name="search" v-model="search">
            <!--<input hidden name="tag" value="" id="tag_input">-->
            <button type="submit" class="button search-icon">
                <img src="resources\pic\search.png" alt="">
            </button>
        </form>
    </div>
    <search-component
            :key="displaykey"
            :load-data = "answer"
            :search = "search"
    >

    </search-component>
    </div>
</template>

<script>
    export default {
        name: "SearchLoadComponent",
        data() {
            return {
                displaykey: 0,
                answer: null,
                search: "",
            }
        },
        mounted() {
            this.loadData('/api/getAllBooks');
        },
        methods: {
            loadData(url) {
                return this.$axios.get(url).then(response => {
                    this.answer = response.data;
                    this.displaykey++;
                });

            }
        }
    }
</script>

<style scoped>

</style>