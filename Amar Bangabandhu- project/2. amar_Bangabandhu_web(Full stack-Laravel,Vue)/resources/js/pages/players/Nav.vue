<template>
<div>

    <!--begin::Header-->
    <div id="kt_header" class="header align-items-stretch" data-kt-sticky="true" data-kt-sticky-name="header" data-kt-sticky-offset="{default: '200px', lg: '300px'}">
        <!--begin::Container-->
        <div class="container-xxl d-flex align-items-center">
            <!--begin::Heaeder menu toggle-->
            <div class="d-flex topbar align-items-center d-lg-none ms-n2 me-3" title="Show aside menu">
                <div class="btn btn-icon btn-active-light-primary w-30px h-30px w-md-40px h-md-40px" id="kt_header_menu_mobile_toggle">
                    <!--begin::Svg Icon | path: icons/duotune/abstract/abs015.svg-->
                    <span class="svg-icon svg-icon-2x">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
											<path d="M21 7H3C2.4 7 2 6.6 2 6V4C2 3.4 2.4 3 3 3H21C21.6 3 22 3.4 22 4V6C22 6.6 21.6 7 21 7Z" fill="black" />
											<path opacity="0.3" d="M21 14H3C2.4 14 2 13.6 2 13V11C2 10.4 2.4 10 3 10H21C21.6 10 22 10.4 22 11V13C22 13.6 21.6 14 21 14ZM22 20V18C22 17.4 21.6 17 21 17H3C2.4 17 2 17.4 2 18V20C2 20.6 2.4 21 3 21H21C21.6 21 22 20.6 22 20Z" fill="black" />
										</svg>
									</span>
                    <!--end::Svg Icon-->
                </div>
            </div>
            <!--end::Heaeder menu toggle-->
            <!--begin::Header Logo-->
            <div class="header-logo me-5 me-md-10 flex-grow-1 flex-lg-grow-0">
                <a href="#">
                    <img alt="Logo"  :src="'/assets/player/images/abb.png'" class="logo-default h-70px" />
                    <img alt="Logo"  :src="'/assets/player/images/abb.png'" class="logo-sticky h-25px" />

                </a>
            </div>
            <!--end::Header Logo-->
            <!--begin::Wrapper-->
            <div class="d-flex align-items-stretch justify-content-between flex-lg-grow-1">
                <!--begin::Navbar-->
                <div class="d-flex align-items-stretch" id="kt_header_nav">
                    <!--begin::Menu wrapper-->
                    <div class="header-menu align-items-stretch" data-kt-drawer="true" data-kt-drawer-name="header-menu" data-kt-drawer-activate="{default: true, lg: false}" data-kt-drawer-overlay="true" data-kt-drawer-width="{default:'200px', '300px': '250px'}" data-kt-drawer-direction="start" data-kt-drawer-toggle="#kt_header_menu_mobile_toggle" data-kt-swapper="true" data-kt-swapper-mode="prepend" data-kt-swapper-parent="{default: '#kt_body', lg: '#kt_header_nav'}">
                        <!--begin::Menu-->
                        <div class="menu menu-lg-rounded menu-column menu-lg-row menu-state-bg menu-title-gray-700 menu-state-icon-primary menu-state-bullet-primary menu-arrow-gray-400 fw-bold my-5 my-lg-0 align-items-stretch" id="#kt_header_menu" data-kt-menu="true">

                            <div data-kt-menu-placement="bottom-start" class="menu-item show menu-lg-down-accordion me-lg-1">
												<span class="menu-link py-3">

                                                         <span class="menu-title">

                                                        Player's Panel

                                                    </span>


												</span>
                            </div>

                            <div data-kt-menu-trigger="click" data-kt-menu-placement="bottom-start" class="menu-item menu-lg-down-accordion me-lg-1">
                                <a href="https://amarbangabandhu.app">
                                                 <span class="menu-link py-3">
													<span class="menu-title" style="color:black">Home</span>
													<span class="menu-arrow d-lg-none"></span>
												</span>
                                </a>
                            </div>
                            <div data-kt-menu-trigger="click" data-kt-menu-placement="bottom-start" class="menu-item menu-lg-down-accordion me-lg-1">
								<a href="https://play.google.com/store/apps/details?id=com.abb.amarbangabandhu.app">
                                                 <span class="menu-link py-3">
													<span class="menu-title" style="color:black">App</span>
													<span class="menu-arrow d-lg-none"></span>
												</span>
                                </a>
                            </div>
                            <div data-kt-menu-trigger="click" data-kt-menu-placement="bottom-start" class="menu-item menu-lg-down-accordion me-lg-1">
								<a @click="logout">
                                                 <span class="menu-link py-3">
													<span class="menu-title" style="color:black">Logout</span>
													<span class="menu-arrow d-lg-none"></span>
												</span>
                                </a>
                            </div>
                        </div>
                        <!--end::Menu-->
                    </div>
                    <!--end::Menu wrapper-->
                </div>
                <!--end::Navbar-->

            </div>
            <!--end::Wrapper-->
        </div>
        <!--end::Container-->
    </div>
    <!--end::Header-->


</div>
</template>

<script>
export default {
    name: "Nav",
    methods:{
        logout(){
            localStorage.removeItem('PrLog');
            window.location.href = '/';
        }
    }
}
</script>

<style scoped>

</style>
