package cn.gov.dao;

import cn.gov.model.Inspection;
import cn.gov.model.InspectionExample;
import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface InspectionMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspection
     *
     * @mbggenerated
     */
    int countByExample(InspectionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspection
     *
     * @mbggenerated
     */
    int deleteByExample(InspectionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspection
     *
     * @mbggenerated
     */
    @Delete({
        "delete from inspection",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspection
     *
     * @mbggenerated
     */
    @Insert({
        "insert into inspection (id, team, ",
        "organization, sort)",
        "values (#{id,jdbcType=INTEGER}, #{team,jdbcType=VARCHAR}, ",
        "#{organization,jdbcType=VARCHAR}, #{sort,jdbcType=INTEGER})"
    })
    int insert(Inspection record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspection
     *
     * @mbggenerated
     */
    int insertSelective(Inspection record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspection
     *
     * @mbggenerated
     */
    List<Inspection> selectByExample(InspectionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspection
     *
     * @mbggenerated
     */
    @Select({
        "select",
        "id, team, organization, sort",
        "from inspection",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @ResultMap("BaseResultMap")
    Inspection selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspection
     *
     * @mbggenerated
     */
    int updateByExampleSelective(@Param("record") Inspection record, @Param("example") InspectionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspection
     *
     * @mbggenerated
     */
    int updateByExample(@Param("record") Inspection record, @Param("example") InspectionExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspection
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Inspection record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspection
     *
     * @mbggenerated
     */
    @Update({
        "update inspection",
        "set team = #{team,jdbcType=VARCHAR},",
          "organization = #{organization,jdbcType=VARCHAR},",
          "sort = #{sort,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Inspection record);
}