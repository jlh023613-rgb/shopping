package com.example.shopping.config;

import com.example.shopping.mapper.ShopMapper;
import com.example.shopping.service.ImageScanService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * 启动时若存在 static/image 且已有 shops 表，则扫描导入店铺与商品（首次可先执行 schema-shops-and-images.sql）
 */
@Component
@Order(2)
public class ImageScanRunner implements CommandLineRunner {

    private final ShopMapper shopMapper;
    private final ImageScanService imageScanService;

    public ImageScanRunner(ShopMapper shopMapper, ImageScanService imageScanService) {
        this.shopMapper = shopMapper;
        this.imageScanService = imageScanService;
    }

    @Override
    public void run(String... args) {
        try {
            imageScanService.scanAndImport();
        } catch (Exception e) {
            // 表未创建或路径不存在时不阻塞启动
        }
    }
}
