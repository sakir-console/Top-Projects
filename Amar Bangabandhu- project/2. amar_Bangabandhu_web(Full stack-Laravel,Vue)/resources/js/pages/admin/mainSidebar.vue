<template>
    <aside class="main-sidebar" v-cloak>
        <!-- sidebar-->
        <section class="sidebar position-relative">
            <div class="multinav">
                <div class="multinav-scroll" style="height: 100%;">
                    <!-- sidebar menu-->
                    <ul class="sidebar-menu" data-widget="tree">
                        <li class="header">Dashboard & Overview</li>


                        <li class="active">
                            <a :href="`dashboard`"> <i class="icon-Layout-4-blocks"><span class="path1"></span><span
                                class="path2"></span></i>
                                <span>Dashboard</span></a>
                        </li>

                        <li class="header">Player & Performances</li>

                        <li class="">
                            <a :href="`topTen`"> <i class="fa fa-star"><span class="path1"></span><span
                                class="path2"></span></i>
                                <span>Top 10 Scores</span></a>
                        </li>
                        <li class="">
                            <a :href="`performance`"> <i class="fa fa-hand-peace-o"><span class="path1"></span><span
                                class="path2"></span></i>
                                <span>Top 100 Scores</span></a>
                        </li>


                        <li class="header">Category wise Top Players</li>


                        <li class="">
                            <a :href="`gen-wise`">
                                <i span class="mdi mdi-gender-transgender"><span class="path1"></span><span
                                    class="path2"></span></i>
                                <span>Gender</span>

                            </a>

                        </li>


                        <li class="">
                            <a :href="`group-wise`">
                                <i span class="mdi mdi-group"><span class="path1"></span><span class="path2"></span></i>
                                <span>Group wise</span>

                            </a>

                        </li>


                        <li class="">
                            <a :href="`pfn-wise`">
                                <i span class="icon-Layout-grid"><span class="path1"></span><span class="path2"></span></i>
                                <span>Parents Profession</span>

                            </a>
                        </li>


                    </ul>
                </div>
            </div>
        </section>
        <div class="sidebar-footer">
               ---- AmarBangabandhu.app
        </div>
    </aside>

</template>

<script>
export default {
    name: "mainSidebar"
}
</script>

<style scoped>

</style>
