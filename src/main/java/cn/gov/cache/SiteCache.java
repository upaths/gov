package cn.gov.cache;

import cn.gov.model.*;
import cn.gov.service.*;

import java.util.*;

/**
 * 网站缓存
 * Created by 王勇 on 2015/9/12.
 */
public class SiteCache {

    private final static Map<Integer, Category> categoryMap = Collections.synchronizedMap(new HashMap<Integer, Category>());
    private static Config config;
    private final static Map<String, IpForbid> ipForbidMap = Collections.synchronizedMap(new HashMap<String, IpForbid>());
    private final static Map<Integer, List<Links>> linkListMap = Collections.synchronizedMap(new HashMap<Integer, List<Links>>());

    public static void updateCategoryCache(List<Category> categories) {
        categoryMap.clear();
        if (categories != null) {
            for (Category category : categories) {
                categoryMap.put(category.getId(), category);
            }
        }
    }

    public static void updateConfigCache(Config config) {
        SiteCache.config = config;
    }

    public static void updateIpForbidCache(List<IpForbid> ipForbids) {
        ipForbidMap.clear();
        if (ipForbids != null) {
            for (IpForbid ipForbid : ipForbids) {
                ipForbidMap.put(ipForbid.getIp(), ipForbid);
            }
        }
    }

    public static void updateLinkListCache(List<LinkCategory> linkCategories, List<Links> links) {
        linkListMap.clear();
        if (linkCategories != null) {
            for (LinkCategory linkCategory : linkCategories) {
                List<Links> linkses = new ArrayList<Links>();
                linkListMap.put(linkCategory.getId(), linkses);
                for (Links link : links) {
                    if (linkCategory.getId() == link.getCatId()) {
                        linkses.add(link);
                    }
                }
            }
        }
    }

    public static Map<Integer, Category> getCategoryMap() {
        return categoryMap;
    }

    public static Config getConfig() {
        return config;
    }

    public static Map<String, IpForbid> getIpForbidMap() {
        return ipForbidMap;
    }

    public static Map<Integer, List<Links>> getLinkListMap() {
        return linkListMap;
    }

}
