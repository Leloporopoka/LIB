<template>
    <nav class="pagination pagination_type1">
        <ol class="pagination__list">
            <li class="pagination__group"><a href="#0" class="pagination__item pagination__control pagination__control_prev">prev</a></li>
            <li class="pagination__group"><a href="#0" class="pagination__item">1</a></li>
            <li class="pagination__group"><span class="pagination__item pagination__item_active">2</span></li>
            <li class="pagination__group"><a href="#0" class="pagination__item">3</a></li>
            <li class="pagination__group"><a href="#0" class="pagination__item pagination__control pagination__control_next">next</a></li>
        </ol>
    </nav>
</template>

<script>
    export default {
        name: "PaginationComponent"
    }
</script>

<style scoped>
    .pagination__list{
        padding-left: 0;
        margin-top: 0;
        margin-bottom: 0;
        list-style: none;
    }

    .pagination{
        --uiPaginationAlign: var(--paginationAlign);
        --uiPaginationArrowSize: var(--paginationArrowSize, 22px);
        --uiPaginationFontSize: var(--paginationFontSize);

        font-size: var(--uiPaginationFontSize);
    }

    .pagination__list{
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        justify-content: var(--uiPaginationAlign);
    }

    .pagination__item:not(.pagination__control_prev):not(.pagination__item_active){
        padding-left: .5em;
    }

    .pagination__item:not(.pagination__control_next):not(.pagination__item_active){
        padding-right: .5em;
    }

    .pagination__item{
        display: inline-block;
        line-height: 1;
    }

    .pagination__control{
        position: relative;
    }

    .pagination__control:before, .pagination__control:after{
        font-size: var(--uiPaginationArrowSize);
        line-height: 1;

        position: absolute;
        top: 50%;
        transform: translateY(-50%);
    }

    .pagination__control_prev{
        padding-left: calc(var(--uiPaginationArrowSize) + 5px);
    }

    .pagination__control_prev:before{
        content: "←";
        left: 0;
    }

    .pagination__control_next{
        padding-right: calc(var(--uiPaginationArrowSize) + 5px);
    }

    .pagination__control_next:after{
        content: "→";
        right: 0;
    }

    .pagination__item_active{
        padding: .5875em .8em;
        margin-right: .5em;
        margin-left: .5em;
    }

    /*
    =====
    LEVEL 2. PRESENTATION STYLES
    =====
    */

    .pagination{
        --uiPaginationItemTextColor: var(--paginationItemTextColor);
        --uiPaginationItemActiveTextColor: var(--paginationItemActiveTextColor);
    }

    .pagination__item{
        text-decoration: none;
        color: var(--uiPaginationItemTextColor);
    }

    .pagination__item_active{
        font-weight: 700;
        color: var(--uiPaginationItemActiveTextColor);
    }

    .pagination__item:focus{
        outline-color: var(--uiPaginationItemActiveBgColor);
    }

    /* type 1 */

    .pagination_type1{
        --uiPaginationItemActiveBgColor: var(--paginationItemActiveBgColor);
    }

    .pagination_type1 .pagination__item_active{
        background-color: var(--uiPaginationItemActiveBgColor);
    }





</style>