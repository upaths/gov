package cn.gov.dao;

import cn.gov.model.Config;
import cn.gov.model.ConfigExample;
import java.util.List;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

public interface ConfigMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table config
     *
     * @mbggenerated
     */
    int countByExample(ConfigExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table config
     *
     * @mbggenerated
     */
    int deleteByExample(ConfigExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table config
     *
     * @mbggenerated
     */
    @Insert({
        "insert into config (zdm, ym, ",
        "bah, bqxx, zdkqgb, ",
        "gbtsxx, wzbt, gjzc, ",
        "wzms, ffzgn)",
        "values (#{zdm,jdbcType=VARCHAR}, #{ym,jdbcType=VARCHAR}, ",
        "#{bah,jdbcType=VARCHAR}, #{bqxx,jdbcType=VARCHAR}, #{zdkqgb,jdbcType=BIT}, ",
        "#{gbtsxx,jdbcType=VARCHAR}, #{wzbt,jdbcType=VARCHAR}, #{gjzc,jdbcType=VARCHAR}, ",
        "#{wzms,jdbcType=VARCHAR}, #{ffzgn,jdbcType=BIT})"
    })
    int insert(Config record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table config
     *
     * @mbggenerated
     */
    int insertSelective(Config record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table config
     *
     * @mbggenerated
     */
    List<Config> selectByExample(ConfigExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table config
     *
     * @mbggenerated
     */
    int updateByExampleSelective(@Param("record") Config record, @Param("example") ConfigExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table config
     *
     * @mbggenerated
     */
    int updateByExample(@Param("record") Config record, @Param("example") ConfigExample example);
}