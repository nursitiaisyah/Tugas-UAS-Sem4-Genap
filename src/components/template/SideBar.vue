<template>
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
        <a href="DashBoard.vue" class="brand-link">
            <span class="brand-text font-weight-light">Toko Elektronik</span>        
        </a>
        
        <!-- Sidebar -->
        <div class="sidebar">             

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>Dashboard</p>
                    </a>
                </li>

                <li class="nav-item">
                    <router-link to="/data_barang" href="#" class="nav-link">
                        <i class="nav-icon fas fas fa-store-alt"></i>
                        <p>Barang</p>
                    </router-link>
                </li>

                <li class="nav-item">
                <router-link to="/data_pelanggan" href="#" class="nav-link">
                        <i class="nav-icon fas fa-users"></i>
                        <p>Pelanggan</p>
                    </router-link>
                </li>

                <li class="nav-item">
                <router-link to="/data_transaksi" href="IndexTransaksi.vue" class="nav-link">
                        <i class="nav-icon fas fa-exchange-alt"></i>
                        <p>Transaksi</p>
                    </router-link>
                </li>

            </ul>
        </nav>
        <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>
</template>

<script>
export default {
    
}
</script>
